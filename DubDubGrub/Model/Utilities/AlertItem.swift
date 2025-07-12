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
}
