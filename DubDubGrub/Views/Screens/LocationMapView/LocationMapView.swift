//
//  LocationMapView.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/17/25.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    @EnvironmentObject private var locationManager: LocationManager
    @StateObject private var viewModel = LocationMapViewModel()

    var body: some View {
        ZStack {
            Map(initialPosition: viewModel.cameraPosition) {
                ForEach(locationManager.locations) { location in
                    Marker(location.name, coordinate: location.location.coordinate)
                        .tint(.brandPrimary)
                }
                
                UserAnnotation()
                    .tint(.pink)
            }
            
            VStack {
                LogoView(frameWidth: 125)
                    .shadow(radius: 10)
                Spacer()
            }
        }
        .sheet(isPresented: $viewModel.isShowingOnboardView, onDismiss: {
            viewModel.checkIfLocationServicesIsEnabled()
        }) {
            OnboardView(isShowingOnboardView: $viewModel.isShowingOnboardView)
        }
        .alert(viewModel.alertItem?.title ?? "no alert",
               isPresented: $viewModel.alertIsPresented,
               actions: { } ,
               message: { viewModel.alertItem?.message ?? Text("no message") }
        )
        .onAppear {
            viewModel.runStartupChecks()
            
            if locationManager.locations.isEmpty {
                viewModel.getLocations(for: locationManager)
            }
        }
    }
}

#Preview {
    LocationMapView()
        .environmentObject(LocationManager())
}
