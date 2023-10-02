import SwiftUI

struct TransportView: View {
    @EnvironmentObject var userInputs: UserInputs
    
    @State private var carMileageText:String = ""
    @State private var shortFlightsText:String = ""
    @State private var longFlightsText:String = ""
    
    
// Whenever a text changes, try to convert it to a Double and update the model
   private func updateModel() {
       if let value = Double(carMileageText) {
           userInputs.carMileage = value
       }
       
       if let value = Double(shortFlightsText) {
           userInputs.shortFlights = value
       }
       
       if let value = Double(longFlightsText) {
           userInputs.longFlights = value
       }
   }
    

    var body: some View {
        VStack {
            Text("Transport")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            VStack(alignment: .leading) {
                Text("Car Mileage")
                    .font(.headline)
                    .padding(.leading, 15)
                TextField("Enter Car Mileage", text: $carMileageText, onCommit: updateModel)
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                Text("Short Flights")
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 10)
                TextField("Enter Short Flights", text: $shortFlightsText, onCommit: updateModel)
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                Text("Long Flights")
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 10)
                TextField("Enter Long Flights", text: $longFlightsText, onCommit: updateModel)
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            }
            .padding(.top, 50)

            NavigationLink(destination: RecyclingView().environmentObject(userInputs)) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.top, 50)
        }
        .padding()
        .onAppear {
                    // Initialize the text fields with the model values when the view appears
                    carMileageText = String(format: "%.2f", userInputs.carMileage)
                    shortFlightsText = String(format: "%.2f", userInputs.shortFlights)
                    longFlightsText = String(format: "%.2f", userInputs.longFlights)
                }
    }
}

struct TransportView_Previews: PreviewProvider {
    static var previews: some View {
        TransportView().environmentObject(UserInputs())
    }
}
