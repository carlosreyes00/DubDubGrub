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
    // MARK: - MapView Errors
    static let unableToGetLocation  = AlertItem(title: "Locations Error",
                                               message: Text("Unable to retrieve locations at this time.\nPlease try again."),
                                               dismissButton: .default(Text("Ok")))
    
    static let locationRestricted   = AlertItem(title: "Location Restricted",
                                               message: Text("Your location is restricted. This may be due to parental controls"),
                                               dismissButton: .default(Text("Ok")))
    
    static let locationDenied       = AlertItem(title: "Location Denied",
                                              message: Text("Dub Dub Grub does not have permission to access your location. To change that go to your phone's Settings > Dub Dub Grub > Location"),
                                              dismissButton: .default(Text("Ok")))
    
    static let locationDisabled     = AlertItem(title: "Location Service Disabled",
                                          message: Text("your phone's location services are disabled. To change that go to your phone's Settings > Privacy > Location"),
                                          dismissButton: .default(Text("Ok")))
    
    // MARK: - ProfileView Errors
    static let invalidProfile       = AlertItem(title: "Invalid Profile",
                                               message: Text("All fields are required as well as a profile photo. Your bio must be < 100 characters.\nPlease try again."),
                                               dismissButton: .default(Text("Ok")))
    
    static let noUserRecord         = AlertItem(title: "No User Record",
                                               message: Text("You must log into iCloud on your phone in order to utilize Dub Dub Grub's Profile. Please log in on your phone's settings screen"),
                                               dismissButton: .default(Text("Ok")))
    
    static let createProfileSuccess = AlertItem(title: "Profile Created Successfully",
                                               message: Text("Your profile has successfully been created."),
                                               dismissButton: .default(Text("Ok")))
    
    static let createProfileFailure = AlertItem(title: "Failed to create profile",
                                               message: Text("We were unable to create your profile ath this time.\nPlease try again later or contact customer support if this persists"),
                                               dismissButton: .default(Text("Ok")))
    
    static let unableToGetProfile   = AlertItem(title: "Unable To Retrieve Profile",
                                              message: Text("We were unable to retrieve your profile ath this time.\nPlease check your internet connection try again later or contact customer support if this persists"),
                                              dismissButton: .default(Text("Ok")))
    
    static let updateProfileSuccess = AlertItem(title: "Profile Update Success!",
                                              message: Text("Your Dub Dub Grub profile was update successfully!"),
                                              dismissButton: .default(Text("Sweet!")))
    
    static let updateProfileFailure = AlertItem(title: "Profile Update Failed!",
                                              message: Text("We were unable to update your profile at this time.\nPlease try again later."),
                                              dismissButton: .default(Text("Ok")))
    
    // MARK: LocationDetailView Errors
    static let invalidPhoneNumber   = AlertItem(title: "Invalid Phone Number!",
                                              message: Text("The phone number for the location is invalid. Please look up the phone number yourself."),
                                              dismissButton: .default(Text("Ok")))
}
