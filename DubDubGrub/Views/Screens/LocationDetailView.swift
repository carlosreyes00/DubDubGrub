//
//  LocationDetailView.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/19/25.
//

import SwiftUI

struct LocationDetailView: View {
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var location: DDGLocation
    
    var body: some View {
            VStack (spacing: 16) {
                BannerImageView(imageName: "default-banner-asset")
                
                HStack {
                    AddressView(address: location.address)
                    Spacer()
                }
                .padding(.horizontal)
                
                DescriptionView(text: location.description)
                
                ZStack {
                    Capsule()
                        .frame(height: 80)
                        .foregroundStyle(Color(.secondarySystemBackground))
                    
                    HStack(spacing: 20) {
                        Button {
                            
                        } label: {
                            LocationActionButton(color: .brandPrimary, imageName: "location.fill")
                        }
                        
                        Link(destination: URL(string: location.websiteURL)!) {
                            LocationActionButton(color: .brandPrimary, imageName: "network")
                        }
                        
                        Button {
                            
                        } label: {
                            LocationActionButton(color: .brandPrimary, imageName: "phone.fill")
                        }
                        
                        Button {
                            
                        } label: {
                            LocationActionButton(color: .brandPrimary, imageName: "person.fill.checkmark")
                        }
                    }
                }
                .padding(.horizontal)
                
                Text("Who's Here?")
                    .bold()
                    .font(.title2)
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<7) { _ in
                            FirstNameAvatarView(name: "Carlos")
                        }
                    }
                }

                Spacer()
            }
            .navigationTitle(location.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct LocationActionButton: View {
    var color: Color
    var imageName: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(color)
                .frame(width: 60, height: 60)
            
            Image(systemName: "\(imageName)")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.white)
                .frame(width: 22, height: 22)
        }
    }
}

struct FirstNameAvatarView: View {
    var name: String
    
    var body: some View {
        VStack {
            AvatarView(size: 64)
            
            Text(name)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.9)
        }
    }
}

#Preview {
    LocationDetailView(location: DDGLocation(record: MockData.location))
}

struct BannerImageView: View {
    
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(height: 120)
    }
}

struct AddressView: View {
    
    var address: String
    
    var body: some View {
        Label(address, systemImage: "mappin.and.ellipse")
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}

struct DescriptionView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .lineLimit(3)
            .minimumScaleFactor(0.9)
            .frame(minHeight: 70)
            .padding(.horizontal)
    }
}
