import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var userInputs: UserInputs

    var body: some View {
        VStack {
            Text("Your Carbon Footprint")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            VStack(alignment: .leading) {
                Text("Total Footprint: \(userInputs.totalFootprint, specifier: "%.2f")")
                    .font(.headline)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)

                Text("Utilities Footprint: \(userInputs.utilitiesFootprint, specifier: "%.2f")")
                    .font(.headline)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)

                Text("Transport Footprint: \(userInputs.transportFootprint, specifier: "%.2f")")
                    .font(.headline)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)

                Text("Recycling Footprint: \(userInputs.recyclingFootprint, specifier: "%.2f")")
                    .font(.headline)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.top, 50)
        }
        .padding()
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView().environmentObject(UserInputs())
    }
}
