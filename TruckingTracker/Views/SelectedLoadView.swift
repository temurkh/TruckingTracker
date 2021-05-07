//
//  SelectedLoadView.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 4/16/21.
//

import SwiftUI

struct SelectedLoadView: View {
    
    @Binding var selectedIsShowing: Bool
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack{
                Button(action: {selectedIsShowing = false}) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(Color.blue)
                        .frame(width: 30, height: 30)
                }
                .padding(.leading, 350.0)
                .padding(.top, 6)
                SelectedList()
                    .navigationTitle("Selected Loads")
                
                Text("Total price: $\(SelectedList.selectedArray.map{($0.price ?? 0)}.reduce(0, +), specifier: "%.02f")")
                    .font(.title2)
                    .fontWeight(.black)
                    .kerning(0.5)
                    .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
                Text("Total mileage: \(SelectedList.selectedArray.map{($0.mileage ?? 0)}.reduce(0, +))")
                    .font(.title2)
                    .fontWeight(.black)
                    .kerning(0.5)
                    .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
                Text("Total hours: \(SelectedList.selectedArray.map{($0.hour ?? 0)}.reduce(0, +))")
                    .font(.title2)
                    .fontWeight(.black)
                    .kerning(0.5)
                    .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
                Text("Total loads: \(SelectedList.selectedArray.count)")
                    .font(.title2)
                    .fontWeight(.black)
                    .kerning(0.5)
                    .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
            }
        }
    }
}

struct selectedLoadEntry: Identifiable, Hashable {
    let id = UUID()
    var loadNumber: String?
    var from: String?
    var to: String?
    var price: Double?
    var hour: Int?
    var mileage: Int?
}


struct SelectedList: View {
    
    static var selectedArray: [selectedLoadEntry] = []
    
    var totalHour: Double?
    
    var body: some View{
        VStack {
            Text("Selected Loads")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
                .offset(y: 15)
            ZStack {
                List{
                    ForEach(SelectedList.selectedArray) { i in
                        HStack {
                            VStack {
                                Text(i.from!)
                                    .fontWeight(.black)
                                Text(i.to!)
                                    .fontWeight(.black)
                                
                            }
                            Spacer()
                            VStack {
                                Text(String(i.mileage!))
                                Text(String(i.hour!))
                            }
                            Spacer()
                            VStack{
                                Text(i.loadNumber!)
                                    .fontWeight(.black)
                                Text("$\(i.price!, specifier: "%.02f")")
                                    .fontWeight(.black)
                                
                            }
                        }
                    }
                    .offset(y: 53)
                }
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct SelectedLoadView_Previews: PreviewProvider {
    static private var selectedIsShowing = Binding.constant(false)
    
    static var previews: some View {
        SelectedLoadView(selectedIsShowing: selectedIsShowing)
    }
}
