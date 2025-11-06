//
//  LoadingView.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 11/1/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .opacity(0.9)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.brandPrimary)
                .scaleEffect(2)
                .offset(y: -40)
        }
    }
}

#Preview {
    LoadingView()
}
