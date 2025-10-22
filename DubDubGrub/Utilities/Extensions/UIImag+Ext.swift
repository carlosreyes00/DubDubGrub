//
//  UIImag+Ext.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 10/22/25.
//

import CloudKit
import SwiftUI

extension UIImage {
    
    func convertToCKAsset() -> CKAsset? {
        
        // Get our apps base document directory url
        guard let urlPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Document Directory url came back nil")
            return nil
        }
        
        // Append some unique identifier for our profile image
        let fileUrl = urlPath.appendingPathComponent("selectedAvatarImage")
        
        // Write the image data to the location the address points to
        guard let imageData = jpegData(compressionQuality: 0.25) else {
            print("image data compression returned nil")
            return nil
        }
        
        // Create our CKAsset with that fileURL
        do {
            try imageData.write(to: fileUrl)
            return CKAsset(fileURL: fileUrl)
        } catch {
            print("error writing image data to file")
            return nil
        }
    }
}
