//
//  LocationManager.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 7/12/25.
//

import Foundation

final class LocationManager: ObservableObject {
    @Published var locations: [DDGLocation] = []
}
