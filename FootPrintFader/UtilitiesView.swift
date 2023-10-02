import SwiftUI

struct UtilitiesView: View {
    @EnvironmentObject var userInputs: UserInputs
    @State private var electricBillText = ""
    @State private var gasBillText = ""
    @State private var oilBillText = ""
    
    // Whenever a text changes, try to convert it to a Double and update the model
       private func updateModel() {
           if let value = Double(electricBillText) {
               userInputs.electricBill = value
           }
           
           if let value = Double(gasBillText) {
               userInputs.gasBill = value
           }
           
           if let value = Double(oilBillText) {
               userInputs.oilBill = value
           }
       }

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
                TextField("Enter Electric Bill", text: $electricBillText, onCommit: updateModel)
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                Text("Gas Bill")
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 10)
                TextField("Enter Gas Bill", text: $gasBillText, onCommit: updateModel)
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                Text("Oil Bill")
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 10)
                TextField("Enter Oil Bill", text: $oilBillText, onCommit: updateModel)
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
        .onAppear {
                    // Initialize the text fields with the model values when the view appears
                    electricBillText = String(format: "%.2f", userInputs.electricBill)
                    gasBillText = String(format: "%.2f", userInputs.gasBill)
                    oilBillText = String(format: "%.2f", userInputs.oilBill)
                }

    }
}

struct UtilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        UtilitiesView().environmentObject(UserInputs())
    }
}
