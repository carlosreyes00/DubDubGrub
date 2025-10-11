//
//  LocationMapViewModel.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 7/12/25.
//

import SwiftUI
import MapKit

final class LocationMapViewModel: NSObject, ObservableObject {
    
    @Published var isShowingOnboardView = false
    @Published var alertItem: AlertItem?
    @Published var alertIsPresented: Bool = false
    
    @Published var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 37.331516,
                longitude: -121.891054
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.01,
                                   longitudeDelta: 0.01)
        )
    )
    
    var deviceLocationManager: CLLocationManager?
    let kHasSeenOnboardView = "hasSeenOnboardView"
    
    var hasSeenOnboardView: Bool {
        return UserDefaults.standard.bool(forKey: kHasSeenOnboardView)
    }
    
    func runStartupChecks() {
        if !hasSeenOnboardView {
            isShowingOnboardView = true
            UserDefaults.standard.set(true, forKey: kHasSeenOnboardView)
        } else {
            checkIfLocationServicesIsEnabled()
        }
    }
    
    func checkIfLocationServicesIsEnabled() {
        DispatchQueue.global(qos: .userInteractive).async { [self] in
            if CLLocationManager.locationServicesEnabled() {
                DispatchQueue.main.async { [self] in
                    deviceLocationManager = CLLocationManager()
                    deviceLocationManager!.delegate = self
                }
            } else {
                DispatchQueue.main.async { [self] in
                    alertItem = AlertContext.locationDisabled
                    alertIsPresented = true
                }
            }
        }
    }
    
    private func checkLocationAuthorization() {
        guard let deviceLocationManager = deviceLocationManager else { return }
        
        switch deviceLocationManager.authorizationStatus {
        case .notDetermined:
            deviceLocationManager.requestWhenInUseAuthorization()
        case .restricted:
            DispatchQueue.main.async { [self] in
                alertItem = AlertContext.locationRestricted
                alertIsPresented = true
            }
        case .denied:
            DispatchQueue.main.async { [self] in
                alertItem = AlertContext.locationDenied
                alertIsPresented = true
            }
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }
    
    func getLocations(for locationManager: LocationManager) {
        CloudKitManager.getLocations { result in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let locations):
                    locationManager.locations = locations
                case .failure(_):
                    alertItem = AlertContext.unableToGetLocation
                    alertIsPresented = true
                }
            }
        }
    }
}

extension LocationMapViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("location manager delegate is being called :)")
        checkLocationAuthorization()
    }
}
