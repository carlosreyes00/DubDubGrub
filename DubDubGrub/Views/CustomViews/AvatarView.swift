//
//  AvatarView.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/22/25.
//

import SwiftUI

struct AvatarView: View {
    var size: CGFloat
    
    var body: some View {
        Image(.defaultAvatar)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(.circle)
    }
}

#Preview {
    AvatarView(size: 90)
}
