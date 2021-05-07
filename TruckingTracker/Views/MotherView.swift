//
//  MotherView.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 4/20/21.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .loginPage:
            LoginViewController()
        case .homePage:
            HomeViewController()
                .transition(.scale)
        }
        
    }
    
    struct MotherView_Previews: PreviewProvider {
        static var previews: some View {
            MotherView().environmentObject(ViewRouter())
        }
    }
}

struct FatherView: View {
    
    @EnvironmentObject var viewRouter2: ViewRouter2
    
    var body: some View{
        switch viewRouter2.currentPage {
        case .signupPage:
            SignupViewController()
        case .homePage:
            HomeViewController()
                .transition(.scale)
        }
    }
}
