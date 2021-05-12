//
//  HomeViewController.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 4/7/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

let testData = [
    Loadd(loadNumber: "6Q7W8E9R0T", from: "LAS VEGAS", to: "MIAMI", hour: 90, price: 5321.48, mileage: 2800),
    Loadd(loadNumber: "7Q7W8E9R0T", from: "JACKSONVILEE", to: "SAN DIEGO", hour: 26, price: 2321.48, mileage: 2800)
]

struct HomeViewController: View {
    
    var loadds = testData
    
    @State private var load = Load()
    @State private var profileIsShowing = false
    @State private var selectedLoadsIsShowing = false
    
    
    var body: some View {
        NavigationView {
            List(loadds){ load in
                HStack{
                    VStack(alignment: .leading) {
                        NameText(text: load.from)
                    }
                    Spacer()
                    Text("→")
                        .font(.title)
                    Spacer()
                    NameText(text: load.to)
                    NavigationLink(
                        destination: LoadView(loadNumber: self.loadNumber!, from: self.from!, to: self.to!, price: self.price!, hour: Int(self.hour!), mileage: Int(self.mileage!)),
                        label: {
                            Text("")
                        })
                        .frame(height: 36.0)
                        .frame(width: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                }
            }
//            List{
//                Section(header: Text("This week").foregroundColor(.blue)){
//                    //nothing for now
////                    ForEach(){ i in
////                        let
////
////                    }
//                    RowView2()
//                }
//                Spacer()
//                Section(header: Text("This month").foregroundColor(.blue)){
//                    ForEach(load.loadEntries.indices){ i in
//                        let loadEntry = load.loadEntries[i]
//                        RowView(load: load, loadNumber: loadEntry.loadNumber, from: loadEntry.from, to: loadEntry.to, price: loadEntry.price, hour: Int(loadEntry.hour), mileage: Int(loadEntry.mileage))
////                    }
//                }
//            }
//            .padding([.leading, .trailing])
//            .navigationTitle("Received Loads")
//            .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
//            .toolbar{
//                ToolbarItem(placement:.navigationBarTrailing) {
//                    Button(action: {selectedLoadsIsShowing = true}, label: {
//                        HStack {
//                            Text(" Select")
//                                .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
//                                .padding(4)
//                            Image("completed")
//                                .resizable()
//                                .padding(6)
//                                .frame(height: 44)
//                                .frame(width: 44)
//                        }
//                        .background(Color("c"))
//                        .cornerRadius(10)
//                        .overlay(RoundedRectangle (cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 2))
//
//                    }).sheet(isPresented: $selectedLoadsIsShowing, onDismiss: {}, content: {
//                        SelectedLoadView(selectedIsShowing: $selectedLoadsIsShowing)
//                    })
//                }
//                ToolbarItem(placement:.navigationBarLeading) {
//                    Button(action: {profileIsShowing = true}, label: {
//                        HStack {
//                            Image("profilepic")
//                                .resizable()
//                                .padding(6)
//                                .frame(height: 44)
//                                .frame(width: 44)
//                            Text("Profile ")
//                                .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
//                                .padding(6)
//                        }
//                        .background(Color("c"))
//                        .cornerRadius(10)
//                        .overlay(RoundedRectangle (cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 2))
//                    }).sheet(isPresented: $profileIsShowing, onDismiss: {}, content: {
//                        ProfileView(profileIsShowing: $profileIsShowing)
//                    })
//                }
//            }
//        }
        .navigationBarHidden(true)
    }
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemTeal]
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemTeal]
    }
}

struct RowView2: View {

    var loadds = testData

    var body: some View{
        List(loadds){ load in
//            VStack {
//                Text(load.from)
//                Text(load.to)
//            }
            HStack{
                VStack(alignment: .leading) {
                    NameText(text: load.from)
                }
                Spacer()
                Text("→")
                    .font(.title)
                Spacer()
                NameText(text: load.to)
                NavigationLink(
                    destination: LoadView(loadNumber: self.loadNumber!, from: self.from!, to: self.to!, price: self.price!, hour: Int(self.hour!), mileage: Int(self.mileage!)),
                    label: {
                        Text("")
                    })
                    .frame(height: 36.0)
                    .frame(width: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct RowView: View {
    let loadNumber: String?
    let from: String?
    let to: String?
    let hour: Int?
    let price: Double?
    let mileage: Int?

    init(load: Load, loadNumber: String, from: String, to: String, price: Double, hour: Int, mileage: Int){
        self.loadNumber = loadNumber
        self.from = from
        self.to = to
        self.price = price
        self.hour = hour
        self.mileage = mileage
    }

    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                NameText(text: self.from!)
            }
            Spacer()
            Text("→")
                .font(.title)
            Spacer()
            NameText(text: self.to!)
            NavigationLink(
                destination: LoadView(loadNumber: self.loadNumber!, from: self.from!, to: self.to!, price: self.price!, hour: Int(self.hour!), mileage: Int(self.mileage!)),
                label: {
                    Text("")
                })
                .frame(height: 36.0)
                .frame(width: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray)
        }
    }
}

struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewController()
    }
}
