//
//  ViewRouter.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 4/20/21.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .loginPage
}

class ViewRouter2: ObservableObject {
    @Published var currentPage: Page2 = .signupPage
}
