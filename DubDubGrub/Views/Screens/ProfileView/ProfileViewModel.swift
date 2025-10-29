//
//  ProfileViewModel.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 10/27/25.
//

import CloudKit

final class ProfileViewModel: ObservableObject {
    
    @Published var firstName    = ""
    @Published var lastName     = ""
    @Published var companyName  = ""
    @Published var bio          = ""
    @Published var avatar       = PlaceholderImage.avatar
    @Published var isShowingPhotoPicker = false
    @Published var alertItem: AlertItem?
    @Published var alertIsPresented: Bool = false
    
    func isValidProfile() -> Bool {
        guard !firstName.isEmpty,
              !lastName.isEmpty,
              !companyName.isEmpty,
              !bio.isEmpty,
              avatar != PlaceholderImage.avatar,
              bio.count <= 100 else { return false }
        
        return true
    }
    
    func createProfile() {
        guard isValidProfile() else {
            alertItem = AlertContext.invalidProfile
            alertIsPresented = true
            return
        }
        
        let profileRecord = createProfileRecord()
        
        guard let userRecord = CloudKitManager.shared.userRecord else {
            // show an alert
            return
        }
        
        userRecord["userProfile"] = CKRecord.Reference(recordID: profileRecord.recordID, action: .none)
        
        CloudKitManager.shared.batchSave(records: [userRecord,profileRecord]) { result in
            switch result {
            case .success():
                print("profile created successfully")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getProfile() {
        
        guard let userRecord = CloudKitManager.shared.userRecord else {
            // show an alert
            return
        }
        
        guard let profileReference = userRecord["userProfile"] as? CKRecord.Reference else  {
            return 
        }
        
        let profileRecordID = profileReference.recordID
        
        CloudKitManager.shared.fetchRecord(with: profileRecordID) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let record):
                    let profile = DDGProfile(record: record)
                    self.firstName   = profile.firstName
                    self.lastName    = profile.lastName
                    self.companyName = profile.companyName
                    self.bio         = profile.bio
                    self.avatar      = profile.createAvatarImage()

                case .failure(_):
                    // show alert
                    break
                }
            }
        }
    }
    
    
    private func createProfileRecord() -> CKRecord {
        
        let profileRecord = CKRecord(recordType: RecordType.profile)
        profileRecord[DDGProfile.kFirstName]    = firstName
        profileRecord[DDGProfile.kLastName]     = lastName
        profileRecord[DDGProfile.kCompanyName]  = companyName
        profileRecord[DDGProfile.kBio]          = bio
        profileRecord[DDGProfile.kAvatar]       = avatar.convertToCKAsset()
        
        return profileRecord
    }
}
