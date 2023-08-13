import SwiftUI

struct TransportView: View {
    @EnvironmentObject var userInputs: UserInputs

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
                TextField("Enter Car Mileage", text: Binding<String>(
                    get: { String(format: "%.2f", self.userInputs.carMileage) },
                    set: {
                        if let value = Double($0) {
                            self.userInputs.carMileage = value
                        }
                    }
                ))
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                Text("Short Flights")
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 10)
                TextField("Enter Short Flights", text: Binding<String>(
                    get: { String(format: "%.2f", self.userInputs.shortFlights) },
                    set: {
                        if let value = Double($0) {
                            self.userInputs.shortFlights = value
                        }
                    }
                ))
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                Text("Long Flights")
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 10)
                TextField("Enter Long Flights", text: Binding<String>(
                    get: { String(format: "%.2f", self.userInputs.longFlights) },
                    set: {
                        if let value = Double($0) {
                            self.userInputs.longFlights = value
                        }
                    }
                ))
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
    }
}

struct TransportView_Previews: PreviewProvider {
    static var previews: some View {
        TransportView().environmentObject(UserInputs())
    }
}
