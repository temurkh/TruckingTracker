//
//  LoadView.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 4/9/21.
//

import SwiftUI

struct LoadView: View {
    @State private var alertIsVisible = false
    
    @State var loadNumber: String = ""
    @State var from: String = ""
    @State var to: String = ""
    @State var price: Double
    @State var hour: Int
    @State var mileage: Int
    
    var body: some View {
        VStack {
            VStack {
                NameText(text: "Load ID")
                    .padding(.trailing,250)
                NameText2(text: loadNumber)
                NameText(text: "From")
                    .padding(.trailing,250)
                NameText2(text: from)
                NameText(text: "To")
                    .padding(.trailing,250)
                NameText2(text: to)
                VStack {
                    NameText(text: "Price")
                        .padding(.trailing, 250)
                    NameText3(text: price)
                    NameText(text: "Hours")
                        .padding(.trailing, 250)
                    NameText4(text: Double(hour))
                    NameText(text: "Mileage")
                        .padding(.trailing, 250)
                    NameText4(text: Double(mileage))
                }
            }
            .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
            .padding()
            Button(action: { withAnimation{
                self.alertIsVisible = true
                SelectedList.selectedArray.append(selectedLoadEntry(loadNumber: self.loadNumber, from: self.from, to: self.to, price: self.price, hour: self.hour, mileage: self.mileage))
            }}, label: {
                Text("Select")
            })
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
            .alert(isPresented: $alertIsVisible, content: {
                return Alert(title: Text("Load is added"), message: Text("Load number - \(loadNumber) has been added to your list"), dismissButton: .default(Text("Continue"), action: {
//                    HomeViewController()
                })
                )
            })
        }
        .offset(y: -40)
    }
}

struct LoadView_Previews: PreviewProvider {
    static var previews: some View {
        LoadView(loadNumber: "1A2B3C4D5E", from: "Chicago", to: "Milwaukee", price: 1234.99, hour: 8, mileage: 70)
    }
}
