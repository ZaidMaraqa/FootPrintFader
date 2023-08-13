//
//  FootPrintFaderApp.swift
//  FootPrintFader
//
//  Created by Zaid Maraqa on 26/06/2023.
//

import SwiftUI

@main
struct FootPrintFader: App {
    @StateObject private var userInputs = UserInputs()

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(userInputs)
        }
    }
}



