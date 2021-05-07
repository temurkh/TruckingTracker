//
//  BackgroundView.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 5/2/21.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        DollaSignView()
    }
}

struct DollaSignView: View {
    var body: some View {
        ZStack {
            Image("dollars")
                .resizable()
                .opacity(0.6)
                .blur(radius: 5)
    //            .frame(width: 120.0, height: 120.0)
                .offset(y: 100)
        }

    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
