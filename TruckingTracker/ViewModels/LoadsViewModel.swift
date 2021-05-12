////
////  LoadsViewModel.swift
////  TruckingTracker
////
////  Created by Temur Khusanboev on 5/10/21.
////
//
//import Foundation
//import FirebaseFirestore
//
//class LoadsViewModel {
//    var loads = [Load]()
//    
//    private var db = Firestore.firestore()
//    
//    func fetchData() {
//        db.collection("Loads").addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
////                print(error?.localizedDescription )
//                print("No documents")
//                return
//            }
//            
//            documents.map { (queryDocumentSnapshot) -> Load in
//                let data = queryDocumentSnapshot.data()
//                
//                let loadNumber = data["loadNumber"]
//                let from = data["from"]
//                let to = data["to"]
//                let hour = data["hour"]
//                let price = data["price"]
//                let mileage = data["mileage"]
//
//                let load = Load(loadNumber: loadNumber, from: from, to: to, hour: hour, price: price, mileage: mileage)
//            }
//        }
//    }
//}
