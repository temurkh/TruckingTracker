//
//  HomeViewController.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 4/7/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct HomeViewController: View {
    
    @ObservedObject private var viewModel = LoadsViewModel()
    
    @State private var load = SampleLoadsCollection()
    @State private var profileIsShowing = false
    @State private var selectedLoadsIsShowing = false
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("This week").foregroundColor(.blue)){
                    List(viewModel.trips) { item in
                        ForEach(viewModel.trips.indices){ i in
                            let tripEntry = viewModel.trips[i]
                            Text(tripEntry.from)
//                            print(tripEntry.from)
                        }
                    }
//                    List(viewModel.trips){
//                        Text(trip.from)
//                    }
                }
                Spacer()
                Section(header: Text("This month").foregroundColor(.blue)){
                    ForEach(load.loadEntries.indices){ i in
                        let loadEntry = load.loadEntries[i]
                        RowView(load: load)
                    }
                }
            }
            .padding([.leading, .trailing])
            .navigationTitle("Received Loads")
            .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
            .onAppear(){
                self.viewModel.fetchData()
            }
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
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemTeal]

        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemTeal]
    }
}

struct RowView: View {
        
    let loadNumber: String?
    let from: String?
    let to: String?
    let hour: Int?
    let price: Double?
    let mileage: Int?

    init(load: SampleLoadsCollection){
        self.loadNumber = load.loadEntries[0].loadNumber
        self.from = load.loadEntries[0].from
        self.to = load.loadEntries[0].to
        self.price = load.loadEntries[0].price
        self.hour = load.loadEntries[0].hour
        self.mileage = load.loadEntries[0].mileage
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
