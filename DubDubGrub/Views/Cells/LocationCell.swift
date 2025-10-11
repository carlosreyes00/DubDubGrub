//
//  LocationCell.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/22/25.
//

import SwiftUI

struct LocationCell: View {
    
    var location: DDGLocation
    
    var body: some View {
        HStack {
            Image(uiImage: location.createSquareImage())
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(.circle)
                .padding(.vertical, 8)
            
            VStack (alignment: .leading) {
                Text(location.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                
                HStack {
                    ForEach(0..<4) { _ in
                        AvatarView(image: PlaceholderImage.avatar, size: 35)
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

#Preview {
    LocationCell(location: DDGLocation(record: MockData.location))
}
