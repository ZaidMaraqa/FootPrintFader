//
//  ContentView.swift
//  CarbonFootPrint
//
//  Created by Zaid Maraqa on 25/06/2023.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        if viewModel.currentUser == nil {
            LogInView() // This should be your actual login view
        } else {
            DashboardView()
        }
    }
}


struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
            .environmentObject(UserInputs())
    }
}


