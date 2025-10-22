//
//  View+Ext.swift
//  DubDubGrub
//
//  Created by Carlos Reyes on 6/22/25.
//

import SwiftUI

extension View {
    func profileNameStyle() -> some View {
        modifier(ProfileNameText())
    }
    
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

}
