//
//  ProfileModalView.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 12/3/25.
//

import SwiftUI

struct ProfileModalView: View {
    
    
    @Binding var isShowingProfileModal: Bool
    var profile: DDGProfile
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 60)
                
                Text(profile.firstName + " " + profile.lastName)
                    .bold()
                    .font(.title2)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                    .padding(.horizontal)
                
                Text(profile.companyName)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                    .foregroundStyle(Color.secondary)
                
                Text(profile.bio)
                    .lineLimit(3)
                    .padding()
            }
            .frame(width: 300, height: 230)
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(alignment: .topTrailing) {
                Button {
                    withAnimation {
                        isShowingProfileModal = false
                    }
                } label: {
                    XDismissButton()
                }
            }
            
            Image(uiImage: profile.createAvatarImage())
                .resizable()
                .scaledToFill()
                .frame(width: 110, height: 110)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 6)
                .offset(y: -120)
        }
    }
}

#Preview {
    ProfileModalView(isShowingProfileModal: .constant(true), profile: MockData.profile.convertToDDGProfile())
}
