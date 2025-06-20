//
//  LocationListView.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/17/25.
//

import SwiftUI

struct LocationListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(1..<10) { item in
                    NavigationLink {
                        LocationDetailView()
                    } label: {
                        LocationCell()
                    }
                }
                .navigationTitle("Grub Spots")
            }
        }
    }
}

struct LocationCell: View {
    var body: some View {
        HStack {
            Image(.defaultSquareAsset)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(.circle)
                .padding(.vertical, 8)
            
            VStack (alignment: .leading) {
                Text("Test location name")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                
                HStack {
                    ForEach(0..<4) { _ in
                        AvatarView(size: 35)
                    }
                    if Bool.random() {
                        Text("+ \(Int.random(in: 1..<4))")
                    }
                }
            }
            .foregroundStyle(.brandPrimary)
            .padding(.leading)
        }
    }
}

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
    LocationListView()
}
