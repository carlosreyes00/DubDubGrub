//
//  LocationListView.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/17/25.
//

import SwiftUI

struct LocationListView: View {
    @State private var places: [(name: String, people: Int)] = [
        ("Ac Kitchen & Lounge", 2),
        ("Chipotle", 7),
        ("Grace Deli", 5),
        ("Mezcal Restaurant", 4),
        ("Original Joe's", 8)
    ]
    
    var body: some View {
        NavigationView {
            List(places, id: \.0) { place in
                NavigationLink {
                    VStack {
                        Text(place.name)
                            .font(.headline)
                        Text("\(place.people)")
                            .font(.footnote)
                    }
                } label: {
                    HStack {
                        Image(.defaultSquareAsset)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .clipShape(.circle)
                            .padding(.vertical, 8)
                        
                        VStack (alignment: .leading) {
                            Text(place.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .minimumScaleFactor(0.75)
                            
                            HStack {
                                ForEach(0..<min(4, place.people), id:\.self) { _ in
                                    AvatarView()
                                }
                                if place.people > 4 {
                                    Text("+ \(place.people - 4)")
                                }
                            }
                        }
                        .padding(.leading)
                    }
                }
            }
            .navigationTitle("Grub Spots")
        }
    }
}

#Preview {
    LocationListView()
}

struct AvatarView: View {
    var body: some View {
        Image(.defaultAvatar)
            .resizable()
            .scaledToFit()
            .frame(width: 35, height: 35)
            .clipShape(.circle)
    }
}
