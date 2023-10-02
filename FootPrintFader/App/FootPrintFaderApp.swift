//
//  FootPrintFaderApp.swift
//  FootPrintFader
//
//  Created by Zaid Maraqa on 26/06/2023.
//

import SwiftUI
import Firebase

@main
struct FootPrintFader: App {
    @StateObject private var userInputs = UserInputs()
    @StateObject private var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(userInputs)
        }
    }
}



