//
//  UserInputs.swift
//  FootPrintFader
//
//  Created by Zaid Maraqa on 01/07/2023.
//

import Foundation
import SwiftUI
import Combine

class UserInputs: ObservableObject {
    @Published var electricBill: Double = 0.0
    @Published var gasBill: Double = 0.0
    @Published var oilBill: Double = 0.0
    @Published var carMileage: Double = 0.0
    @Published var shortFlights: Double = 0.0
    @Published var longFlights: Double = 0.0
    @Published var recycleNewspaper: Bool = false
    @Published var recycleAluminumTin: Bool = false

    var utilitiesFootprint: Double {
        return electricBill * 105 + gasBill * 105 + oilBill * 113
    }

    var transportFootprint: Double {
        return carMileage * 0.79 + shortFlights * 1100 + longFlights * 4400
    }

    var recyclingFootprint: Double {
        let recycleNewspaperValue = recycleNewspaper ? 0.0 : 184.0
        let recycleAluminumTinValue = recycleAluminumTin ? 0.0 : 166.0

        return recycleNewspaperValue + recycleAluminumTinValue
    }

    var totalFootprint: Double {
        return utilitiesFootprint + transportFootprint + recyclingFootprint
    }

}





