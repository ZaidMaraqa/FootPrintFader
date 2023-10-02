//
//  ContentView.swift
//  CarbonFootPrint
//
//  Created by Zaid Maraqa on 25/06/2023.
//

import SwiftUI


struct ContentView: View{
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                DashboardView()

            } else{
                WelcomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}


