//
//  CalculatorView.swift
//  FootPrintFader
//
//  Created by Zaid Maraqa on 01/07/2023.
//

import SwiftUI

struct InputField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.numberPad)
            .padding(.horizontal)
    }
}




struct CalculatorView: View {
    @State private var electricBill = ""
    @State private var gasBill = ""
    @State private var oilBill = ""
    @State private var carMileage = ""
    @State private var shortFlights = ""
    @State private var longFlights = ""
    @State private var recycleNewspaper = false
    @State private var recycleAluminumTin = false
    @State private var result = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Carbon Footprint Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            InputField(placeholder: "Electric bill", text: $electricBill)
            InputField(placeholder: "Gas bill", text: $gasBill)
            InputField(placeholder: "Oil bill", text: $oilBill)
            InputField(placeholder: "Car mileage", text: $carMileage)
            InputField(placeholder: "Short flights", text: $shortFlights)
            InputField(placeholder: "Long flights", text: $longFlights)
            Toggle("Recycle newspaper", isOn: $recycleNewspaper)
            Toggle("Recycle aluminum and tin", isOn: $recycleAluminumTin)
            Button(action: { calculateCarbonFootprint() }) {
                Text("Calculate")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
        }.padding()
    }

    func calculateCarbonFootprint() {
        // get values from text fields, convert to Double
        guard let electricBill = Double(electricBill),
              let gasBill = Double(gasBill),
              let oilBill = Double(oilBill),
              let carMileage = Double(carMileage),
              let shortFlights = Double(shortFlights),
              let longFlights = Double(longFlights) else {
            // show error if values are not valid numbers
            result = "Please enter valid numbers"
            return
        }
        
        // calculate carbon footprint
        var carbonFootprint = 0.0
        carbonFootprint += electricBill * 105
        carbonFootprint += gasBill * 105
        carbonFootprint += oilBill * 113
        carbonFootprint += carMileage * 0.79
        carbonFootprint += shortFlights * 1100
        carbonFootprint += longFlights * 4400
        
        // Add 184 if not recycling newspaper
        if !recycleNewspaper {
            carbonFootprint += 184
        }
        
        // Add 166 if not recycling aluminum and tin
        if !recycleAluminumTin {
            carbonFootprint += 166
        }
        
        // display result
        result = "Your total carbon footprint is \(carbonFootprint)"
    }
}


struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
