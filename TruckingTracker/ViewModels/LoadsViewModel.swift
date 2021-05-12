////
////  LoadsViewModel.swift
////  TruckingTracker
////
////  Created by Temur Khusanboev on 5/10/21.
////

import Foundation
import FirebaseFirestore

class LoadsViewModel: ObservableObject {
    @Published var trips = [Trip]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("trips").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.trips = documents.map { (queryDocumentSnapshot) -> Trip in
                let data = queryDocumentSnapshot.data()
                
                let loadNumber = data["loadNumber"] as? String ?? ""
                let from = data["from"] as? String ?? ""
                let to = data["to"] as? String ?? ""
                let hour = data["hour"] as? Int ?? 0
                let price = data["price"] as? Double ?? 0
                let mileage = data["mileage"] as? Int ?? 0
                
                return Trip(loadNumber: loadNumber, from: from, to: to, hour: hour, price: price, mileage: mileage)
            }
        }
    }
}
