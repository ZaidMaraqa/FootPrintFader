import SwiftUI

struct DashboardView: View {
    @State private var selectedTab = 0
    @EnvironmentObject var userInputs: UserInputs
    @ObservedObject var authViewModel = AuthViewModel()
    
    var body: some View {
        
        NavigationView{
            ZStack {
                // Background Image
                Image("DashBoardPic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack {
                        
                        if authViewModel.currentUser?.carbonFootprint == nil || authViewModel.currentUser?.carbonFootprint == 0   {
                            NavigationLink(destination: UtilitiesView().environmentObject(userInputs)) {
                                Text("Calculate")
                                    .background(Color(.systemBrown))
                                    .foregroundColor(Color.white)
                                    .cornerRadius(8)
                                
                                
                            }
                        } else {
                            VStack(alignment: .leading) {
                                Text("\(Int(userInputs.totalFootprint))")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .fontDesign(.monospaced)
                                Text("tons of CO2e")
                                    .fontDesign(.monospaced)
                                    .fontWeight(.semibold)
                            }
                            .padding(.leading, -160)
                            .padding(.bottom, 85)
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.35)
                    
                    // Grid section for ways to reduce footprint
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                            ForEach(0..<4) { item in
                                VStack {
                                    // Replace with relevant content
                                    Image(systemName: "leaf.arrow.circlepath")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.brown)
                                    Text("Get a hybird car")
                                        .font(.caption)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            }
                        }
                        .padding()
                    }
                }
                VStack {
                    Spacer()
                    HStack(spacing: 80) {
                        Button(action: { selectedTab = 0 }) {
                            Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                        }
                        Button(action: { selectedTab = 1 }) {
                            Image(systemName: selectedTab == 1 ? "person.fill" : "person")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        Button(action: { selectedTab = 2 }) {
                            Image(systemName: selectedTab == 2 ? "gearshape.fill" : "gearshape")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        Button(action: {authViewModel.signOut()}){
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                            
                        }
                    }
                    .padding()
                    .shadow(radius: 5)
                    .accentColor(Color(.systemBrown))
                }
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environmentObject(AuthViewModel())
            .environmentObject(UserInputs())
    }
}
