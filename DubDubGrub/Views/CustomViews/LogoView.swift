//
//  LogoView.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 7/15/25.
//

import SwiftUI

struct LogoView: View {
    
    var frameWidth: CGFloat
    var body: some View {
        Image(.ddgMapLogo)
            .resizable()
            .scaledToFit()
            .frame(width: frameWidth)
    }
}
