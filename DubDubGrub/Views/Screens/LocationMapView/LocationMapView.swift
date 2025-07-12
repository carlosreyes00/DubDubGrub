//
//  LocationMapView.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/17/25.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    
    @StateObject private var viewModel = LocationMapViewModel()

    var body: some View {
        ZStack {
            Map(position: $viewModel.cameraPosition).ignoresSafeArea()
            
            VStack {
                LogoView().shadow(radius: 10)
                Spacer()
            }
        }
        .alert(viewModel.alertItem?.title ?? "no alert",
               isPresented: $viewModel.alertIsPresented,
               actions: { } ,
               message: { viewModel.alertItem?.message ?? Text("no message") }
        )
        .onAppear {
            viewModel.getLocations()
        }
    }
}

#Preview {
    LocationMapView()
}

struct LogoView: View {
    var body: some View {
        Image(.ddgMapLogo)
            .resizable()
            .scaledToFit()
            .frame(height: 70)
    }
}
