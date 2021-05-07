//
//  HomeViewController.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 4/7/21.
//

import SwiftUI

struct HomeViewController: View {
    @State private var load = Load()
    @State private var profileIsShowing = false
    @State private var selectedLoadsIsShowing = false
    
    
    var body: some View {
        
            NavigationView {
                List{
                    Section(header: Text("This week")){
    //                    ForEach(load.loadEntries.indices){ i in
    //                        let loadEntry = load.loadEntries[i]
    //                        RowView(load: load, loadNumber: loadEntry.loadNumber, from: loadEntry.from, to: loadEntry.to, price: loadEntry.price, hour: loadEntry.hour, mileage: loadEntry.mileage)
    //                    }
                    }
                    Spacer()
                    
                    Section(header: Text("This month")){
                        ForEach(load.loadEntries.indices){ i in
                            let loadEntry = load.loadEntries[i]
                            RowView(load: load, loadNumber: loadEntry.loadNumber, from: loadEntry.from, to: loadEntry.to, price: loadEntry.price, hour: loadEntry.hour, mileage: loadEntry.mileage)
                        }
                    }
                }
                .padding([.leading, .trailing])
//                .navigationTitle("Received Loads")
//                .font(.title)
                .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
                .toolbar{
                    ToolbarItem(placement:.navigationBarTrailing) {
                        Button(action: {selectedLoadsIsShowing = true}, label: {
                            HStack {
                                Text(" Select")
                                    .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
                                    .padding(4)
                                Image("completed")
                                    .resizable()
                                    .padding(6)
                                    .frame(height: 44)
                                    .frame(width: 44)
                            }
                            .background(Color("c"))
                            .cornerRadius(10)
                            .overlay(RoundedRectangle (cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 2))

                        }).sheet(isPresented: $selectedLoadsIsShowing, onDismiss: {}, content: {
                            SelectedLoadView(selectedIsShowing: $selectedLoadsIsShowing)
                        })
                    }
                    ToolbarItem(placement:.navigationBarLeading) {
                        Button(action: {profileIsShowing = true}, label: {
                            HStack {
                                Image("profilepic")
                                    .resizable()
                                    .padding(6)
                                    .frame(height: 44)
                                    .frame(width: 44)
                                Text("Profile ")
                                    .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
                                    .padding(6)
                            }
                            .background(Color("c"))
                            .cornerRadius(10)
                            .overlay(RoundedRectangle (cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 2))
                        }).sheet(isPresented: $profileIsShowing, onDismiss: {}, content: {
                            ProfileView(profileIsShowing: $profileIsShowing)
                        })
                    }
                }
            }
            .navigationBarHidden(true)
    }
}

struct RowView: View {
    let loadNumber: String?
    let from: String?
    let to: String?
    let hour: Double?
    let price: Double?
    let mileage: Double?
    
    init(load: Load, loadNumber: String, from: String, to: String, price: Double, hour: Double, mileage: Double){
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
            Spacer()
            NameText(text: self.to!)
            NavigationLink(
                destination: LoadView(loadNumber: self.loadNumber!, from: self.from!, to: self.to!, price: self.price!, hour: self.hour!, mileage: self.mileage!),
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
