//
//  StartViewController.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 4/4/21.
//

import SwiftUI
import UIKit
//import Firebase

struct StartViewController: View {
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                VStack {
                    AppName()
                    ZStack {
                        Image("dollarsign")
                            .resizable()
                            .frame(width: 200.0, height: 200.0)
                        Image("semitruck")
                        Image("t")
                            .resizable()
                            .frame(width: 150.0, height: 150.0)
                            .offset(x: 10, y: -10.0)
                    }
                    Spacer()
                    Button(action: {}) {
                        Login()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    Button(action: {}) {
                        Signup()
                    }
                    .padding(.bottom)
                }
            }
            .accentColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
            
        }
    }
}

struct Login: View {
    var body: some View {
        NavigationLink(
            destination: MotherView().environmentObject(ViewRouter()),
            label: {
                Text("LOGIN")
            })
    }
}

struct Signup: View {
    var body: some View {
        NavigationLink(
            destination: FatherView().environmentObject(ViewRouter2()),
            label: {
                Text("SIGN UP")
                    .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
            })
    }
}

struct StartViewController_Previews: PreviewProvider {
    static var previews: some View {
        StartViewController()
    }
}

struct AppName: View {
    var body: some View {
        ZStack {
            Text("TruckingTracker")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
        }
        
    }
}
