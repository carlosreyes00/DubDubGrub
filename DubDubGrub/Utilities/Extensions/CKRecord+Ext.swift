//
//  CKRecord+Ext.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/29/25.
//

import CloudKit

extension CKRecord {
    func convertToDDGLocation() -> DDGLocation {
        DDGLocation(record: self)
    }
    
    func convertToDDGProfile() -> DDGProfile {
        DDGProfile(record: self)
    }
}

