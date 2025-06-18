//
//  LocationMapView.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/17/25.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516,
                                                                                                                   longitude: -121.891054),
                                                                                    span: MKCoordinateSpan(latitudeDelta: 0.01,
                                                                                                           longitudeDelta: 0.01)))
    
    var body: some View {
        ZStack {
            Map(position: $cameraPosition)
                .ignoresSafeArea()
            
            VStack {
                Image(.ddgMapLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .shadow(radius: 10)
                Spacer()
            }
        }
    }
}

#Preview {
    LocationMapView()
}
