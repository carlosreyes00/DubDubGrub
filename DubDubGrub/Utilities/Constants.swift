//
//  Constants.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/29/25.
//

import SwiftUI

enum RecordType {
    static let location = "DDGLocation"
    static let profile = "DDGProfile"
}

enum PlaceholderImage {
    static let avatar = UIImage(resource: .defaultAvatar)
    static let square = UIImage(resource: .defaultSquareAsset)
    static let banner = UIImage(resource: .defaultBannerAsset)
}

enum ImageDimension {
    case square, banner
    
    static func getPlaceholder(for dimension: ImageDimension) -> UIImage {
        switch dimension {
        case .square:
            return PlaceholderImage.square
        case .banner:
            return PlaceholderImage.banner
        }
    }
}
