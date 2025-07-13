//
//  AlertItem.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 7/12/25.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    // Mark: - MapView Errors
    static let unableToGetLocation = AlertItem(title: "Locations Error",
                                               message: Text("Unable to retrieve locations at this time.\nPlease try again."),
                                               dismissButton: .default(Text("Ok")))
    
    static let locationRestricted = AlertItem(title: "Location Restricted",
                                               message: Text("Your location is restricted. This may be due to parental controls"),
                                               dismissButton: .default(Text("Ok")))
    
    static let locationDenied = AlertItem(title: "Location Denied",
                                              message: Text("Dub Dub Grub does not have permission to access your location. To change that go to your phone's Settings > Dub Dub Grub > Location"),
                                              dismissButton: .default(Text("Ok")))
    
    static let locationDisabled = AlertItem(title: "Location Service Disabled",
                                          message: Text("your phone's location services are disabled. To change that go to your phone's Settings > Privacy > Location"),
                                          dismissButton: .default(Text("Ok")))
}
