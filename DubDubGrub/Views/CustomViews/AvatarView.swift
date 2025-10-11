//
//  AvatarView.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/22/25.
//

import SwiftUI

struct AvatarView: View {
    
    var image: UIImage
    var size: CGFloat
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(.circle)
    }
}

#Preview {
    AvatarView(image: PlaceholderImage.avatar, size: 90)
}
