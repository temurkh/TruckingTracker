//
//  Load.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 4/9/21.
//

import Foundation
import Firebase
import FirebaseFirestore

struct LoadEntry: Identifiable {
    var id: String = UUID().uuidString
    
    let loadNumber: String
    let from: String
    let to: String
    let hour: Int
    let price: Double
    let mileage: Int
}

struct SampleLoadsCollection: Identifiable {
    var id: String = UUID().uuidString
    var loadEntries: [LoadEntry] = []

    init (loadTestData: Bool = true){
        if loadTestData {
            loadEntries.append(LoadEntry(loadNumber: "1A2B3C4D5E", from: "CHICAGO", to: "MENASHA", hour: 5, price: 1230.00, mileage: 180))
            loadEntries.append(LoadEntry(loadNumber: "2B3C4D5E6F", from: "GREENBAY", to: "NEW YORK", hour: 24, price: 4230.00, mileage: 1180))
            loadEntries.append(LoadEntry(loadNumber: "3C4D5E6F7G", from: "NEW YORK", to: "MINNEAPOLIS", hour: 30, price: 5230.00, mileage: 1300))
        }
    }
}
