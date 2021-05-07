//
//  Load.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 4/9/21.
//

import Foundation

struct LoadEntry {
    let loadNumber: String
    let from: String
    let to: String
    let hour: Double
    let price: Double
    let mileage: Double

}

struct Load {
    var loadEntries: [LoadEntry] = []
    
    init (loadTestData: Bool = true){
        if loadTestData {
            loadEntries.append(LoadEntry(loadNumber: "1A2B3C4D5E", from: "CHICAGO", to: "MENASHA", hour: 5, price: 1230.00, mileage: 180))
            loadEntries.append(LoadEntry(loadNumber: "2B3C4D5E6F", from: "GREENBAY", to: "NEW YORK", hour: 24, price: 4230.00, mileage: 1180))
            loadEntries.append(LoadEntry(loadNumber: "3C4D5E6F7G", from: "NEW YORK", to: "MINNEAPOLIS", hour: 30, price: 5230.00, mileage: 1300))
//            loadEntries.append(LoadEntry(loadNumber: "1A2B3C4D5E", from: "4310 N KEYSTONE AVE CHICAGO IL 60641", to: "720 TAYCO ST MENASHA WI 54302", hour: 8, price: 1230.00, mileage: 180))
//            loadEntries.append(LoadEntry(loadNumber: "2B3C4D5E6F", from: "4310 N KEYSTONE AVE CHICAGO IL 60641", to: "720 TAYCO ST MENASHA WI 54302", hour: 8, price: 1230.00, mileage: 180))
//            loadEntries.append(LoadEntry(loadNumber: "3C4D5E6F7G", from: "4310 N KEYSTONE AVE CHICAGO IL 60641", to: "720 TAYCO ST MENASHA WI 54302", hour: 8, price: 1230.00, mileage: 180))
        }
    }
}
