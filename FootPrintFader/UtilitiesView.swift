import SwiftUI

struct UtilitiesView: View {
    @EnvironmentObject var userInputs: UserInputs
    @State private var electricBillText = ""
    @State private var gasBillText = ""
    @State private var oilBillText = ""

    var body: some View {
        VStack {
            Text("Utilities")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            VStack(alignment: .leading) {
                Text("Electric Bill")
                    .font(.headline)
                    .padding(.leading, 15)
                TextField("Enter Electric Bill", text: Binding<String>(
                    get: { String(self.userInputs.electricBill) },
                    set: {
                        if let value = Double($0) {
                            self.userInputs.electricBill = value
                        }
                    }
                ))
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                Text("Gas Bill")
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 10)
                TextField("Enter Gas Bill", text: Binding<String>(
                    get: { String(self.userInputs.gasBill) },
                    set: {
                        if let value = Double($0) {
                            self.userInputs.gasBill = value
                        }
                    }
                ))
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                Text("Oil Bill")
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 10)
                TextField("Enter Oil Bill", text:
                    Binding<String>(
                    get: {
                        String(self.userInputs.oilBill)
                        },
                    set: {
                        if let value = Double($0){
                            self.userInputs.oilBill = value
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

            NavigationLink(destination: TransportView().environmentObject(userInputs)) {
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

struct UtilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        UtilitiesView().environmentObject(UserInputs())
    }
}
