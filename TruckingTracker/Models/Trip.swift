//
//  Trip.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 5/12/21.
//

import Foundation

struct Trip: Identifiable {
    var id: String = UUID().uuidString
    var loadNumber: String
    var from: String
    var to: String
    var hour: Int
    var price: Double
    var mileage: Int
}
