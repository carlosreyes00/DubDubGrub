//
//  CustomModifiers.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/22/25.
//

import SwiftUI

struct ProfileNameText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 32, weight: .bold))
            .lineLimit(1)
            .minimumScaleFactor(0.9)
    }
}

