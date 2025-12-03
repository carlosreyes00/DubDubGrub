//
//  MockData.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/29/25.
//

import CloudKit

struct MockData {
    
    static var location: CKRecord {
        let record = CKRecord(recordType: RecordType.location)
        record[DDGLocation.kName]           = "Carlos' Bar and Grill"
        record[DDGLocation.kAddress]        = "123 Main Street"
        record[DDGLocation.kDescription]    = "This is a test description. But this place is awesome, though. I just keep typing cause we're testing the 3 lines ;)"
        record[DDGLocation.kWebSite]        = "https://apple.com"
        record[DDGLocation.kLocation]       = CLLocation(latitude: 37.331516, longitude: -121.891054) //San Jose Convention Center
        record[DDGLocation.kPhoneNumber]    = "1234567890"
        
        return record
    }
    
    static var profile: CKRecord {
        let record = CKRecord(recordType: RecordType.profile)
        record[DDGProfile.kFirstName]           = "FirstName"
        record[DDGProfile.kLastName]        = "LastName"
        record[DDGProfile.kCompanyName]    = "CompanyTest"
        record[DDGProfile.kBio]        = "This is the bio test."
        
        return record
    }
}
