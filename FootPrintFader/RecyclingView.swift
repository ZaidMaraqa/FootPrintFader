import SwiftUI

struct RecyclingView: View {
    @EnvironmentObject var userInputs: UserInputs
    @ObservedObject var authViewModel = AuthViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Recycling")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                    Text("Recycle Newspaper")
                        .font(.headline)
                        .padding(.leading, 15)
                    Toggle("", isOn: $userInputs.recycleNewspaper)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Text("Recycle Aluminum and Tin")
                        .font(.headline)
                        .padding(.leading, 15)
                        .padding(.top, 10)
                    Toggle("", isOn: $userInputs.recycleAluminumTin)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.top, 50)
                
                NavigationLink(destination: DashboardView().environmentObject(userInputs)) {
                    Text("Calculate")
                        .onTapGesture {
                            let footprintValue = userInputs.totalFootprint
                            authViewModel.saveFootprintToFirebase(footprint: footprintValue)
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }  .padding(.top, 50)
            }
            .padding()
        }
    }
}

struct RecyclingView_Previews: PreviewProvider {
    static var previews: some View {
        RecyclingView().environmentObject(UserInputs())
    }
}

