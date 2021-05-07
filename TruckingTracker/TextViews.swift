//
//  TextViews.swift
//  ShoppingCartt
//
//  Created by Temur Khusanboev on 3/3/21.
//

import SwiftUI

struct NameText: View {
    
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .frame(alignment: .leading)
    }
}

struct NameText2: View {
    
    var text: String
    var body: some View {
        Text(text)
            .padding()
            .frame(width: 350, height: 50)
            .background(Color(hue: 1.0, saturation: 0.008, brightness: 0.922))
            .cornerRadius(15.0)
            .padding(.bottom, 20)
    }
}

struct NameText3: View {
    
    var text: Double
    var body: some View {
        Text("$\(text, specifier: "%.02f")")
            .padding()
            .frame(width: 350, height: 50)
            .background(Color(hue: 1.0, saturation: 0.008, brightness: 0.922))
            .cornerRadius(15.0)
            .padding(.bottom, 20)
    }
}

struct NameText4: View {
    
    var text: Double
    var body: some View {
        Text(String(text))
            .padding()
            .frame(width: 350, height: 50)
            .background(Color(hue: 1.0, saturation: 0.008, brightness: 0.922))
            .cornerRadius(15.0)
            .padding(.bottom, 20)
    }
}

struct DescriptionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .foregroundColor(Color.gray)
            .kerning(1.5)
            .font(.caption)
            .multilineTextAlignment(.center)
    }
}

struct PriceText: View {
    var text: Double
    var body: some View {
        Text("$\(text, specifier: "%.02f")")
            .kerning(2.0)
            .font(.title3)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NameText(text: "Name")
            NameText2(text: "LoadNumber")
            NameText3(text: 12345)
            NameText4(text: 54321)
            DescriptionText(text: "Description of item")
            PriceText(text: 99.99)
        }
        .padding()
    }
}
