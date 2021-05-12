////
////  HomeView.swift
////  TruckingTracker
////
////  Created by Temur Khusanboev on 5/11/21.
////
//
//import SwiftUI
//
//let testData = [
//    Loadd(loadNumber: "6Q7W8E9R0T", from: "LAS VEGAS", to: "MIAMI", hour: 90, price: 5321.48, mileage: 2800),
//    Loadd(loadNumber: "7Q7W8E9R0T", from: "JACKSONVILEE", to: "SAN DIEGO", hour: 26, price: 2321.48, mileage: 2800)
//]
//
//struct HomeView: View {
//    
//    var loadds = testData
//    @State private var profileIsShowing = false
//    @State private var selectedLoadsIsShowing = false
//    
//    var body: some View {
//        NavigationView {
//            List(loadds){ load in
//                Text(load.from)
//                Text(load.to)
//                NavigationLink(destination: LoadView(),
//                       label: {
//                           Text("")
//                       })
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
//    }
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
