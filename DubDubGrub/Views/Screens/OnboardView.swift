//
//  OnboardView.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 7/15/25.
//

import SwiftUI

struct OnboardView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    XDismissButton()
                }
            }
            
            Spacer()
            
            LogoView(frameWidth: 250)
                .padding(.bottom)
            
            VStack (alignment: .leading, spacing: 32) {
                OnboardInfoView(imageName: "building.2.crop.circle",
                                title: "Restaurant Locations",
                                description: "Find places to dine around the convention center")
                
                OnboardInfoView(imageName: "checkmark.circle",
                                title: "Check In",
                                description: "Let other iOs devs know where you are")
                
                OnboardInfoView(imageName: "person.2.circle",
                                title: "Restaurant Locations",
                                description: "See where other iOS Devs are and join the party")
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
    }
}

#Preview {
    OnboardView()
}

struct OnboardInfoView: View {
    
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        HStack (spacing: 26) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(.brandPrimary)
            
            VStack (alignment: .leading, spacing: 4) {
                Text(title).bold()
                Text(description)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
        }
    }
}
