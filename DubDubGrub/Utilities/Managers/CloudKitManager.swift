//
//  CloudKitManager.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/29/25.
//

import CloudKit

struct CloudKitManager {
    
    static func getLocations(completed: @escaping (Result<[DDGLocation], Error>) -> Void) {
        let sortDescriptor = NSSortDescriptor(key: DDGLocation.kName, ascending: true)
        let query = CKQuery(recordType: RecordType.location, predicate: NSPredicate(value: true))
        query.sortDescriptors = [sortDescriptor]
        
        CKContainer.default().publicCloudDatabase.fetch(withQuery: query) { result in
            switch result {
            case .success((let matchResults, _)):
                do {
                    let locations = try! matchResults.map {
                        try $1.get().convertToDDGLocation()
                    }
                    completed(.success(locations))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
