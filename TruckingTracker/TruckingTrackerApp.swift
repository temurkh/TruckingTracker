//
//  TruckingTrackerApp.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 4/4/21.
//

import SwiftUI
import Firebase

@main
struct TruckingTrackerApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            MotherView()
            ContentView().environmentObject(viewRouter)
//            AuthenticationService.signIn()
        }
    }
    
    func application( application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                      [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
