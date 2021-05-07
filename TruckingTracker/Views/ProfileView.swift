//
//  ProfileView.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 4/17/21.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var profileIsShowing: Bool
    @State var driverName: String = ""
    @State var driverID: String = ""
    @State var licenseID: String = ""
    @State var truckID: String = ""
    @State var truckPlate: String = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("Driver Name")
                    .bold()
                    .font(.title3)
                    .padding(.trailing,250)
                    .frame(alignment: .leading)
                TextField("Driver Name", text: $driverName)
                    .padding()
                    .background(Color(hue: 1.0, saturation: 0.008, brightness: 0.922))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                Text("Driver ID")
                    .bold()
                    .font(.title3)
                    .padding(.trailing,280)
                    .frame(alignment: .leading)
                TextField("Driver ID", text: $driverID)
                    .padding()
                    .background(Color(hue: 1.0, saturation: 0.008, brightness: 0.922))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                Text("Drivers License Number")
                    .bold()
                    .font(.title3)
                    .padding(.trailing,140)
                    .frame(alignment: .leading)
                TextField("Drivers License Number", text: $licenseID)
                    .padding()
                    .background(Color(hue: 1.0, saturation: 0.008, brightness: 0.922))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                Text("Truck ID")
                    .bold()
                    .font(.title3)
                    .padding(.trailing,285)
                    .frame(alignment: .leading)
                TextField("Truck ID", text: $truckID)
                    .padding()
                    .background(Color(hue: 1.0, saturation: 0.008, brightness: 0.922))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                Text("Truck Plate Number")
                    .bold()
                    .font(.title3)
                    .padding(.trailing,180)
                    .frame(alignment: .leading)
                TextField("Truck Plate Number", text: $truckPlate)
                    .padding()
                    .background(Color(hue: 1.0, saturation: 0.008, brightness: 0.922))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
            }
            .padding()
            Button(action: {}) {
                Text("Save")
            }
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.blue)
            .cornerRadius(15.0)
            Button(action: {profileIsShowing = false}) {
                Text("Back")
            }
            .font(.title2)
            .foregroundColor(.blue)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.white)
            .cornerRadius(15.0)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static private var profileIsShowing = Binding.constant(false)
    
    static var previews: some View {
        //        ProfileView(profileIsShowing: profileIsShowing)
        ProfileView(profileIsShowing: profileIsShowing)
    }
}
