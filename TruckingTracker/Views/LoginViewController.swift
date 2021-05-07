//
//  LoginViewController.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 4/7/21.
//

import SwiftUI
import Firebase

//let storedEmail = "Email"
//let storedPassword = "123"

struct LoginViewController: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    @State var alert = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    Image("semitruck")
                        .contrast(0.01)
                        .offset(y: -36)
                        .colorMultiply(.green)
                        .saturation(6)
                    Image("distance")
                        .resizable()
                        .frame(height: 300)
                        .frame(width: 300)
                        .offset(y: -60)
                        .colorMultiply(.secondary)
                        .saturation(9)

                }
                Text("Email")
                    .bold()
                    .font(.title3)
                    .padding(.trailing,260)
                    .frame(alignment: .leading)
                    .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
                EmailTextField(email: self.$email)
                
                Text("Password")
                    .bold()
                    .font(.title3)
                    .padding(.trailing,225)
                    .frame(alignment: .leading)
                    .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
                PasswordSecureField(password: self.$password)
                if authenticationDidFail {
                    Text("Incorrect information. Try again.")
                        .foregroundColor(.red)
                        .offset(y: -90)
                }
                
                Button(action: {login()}) {
                    Text("LOGIN")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.green)
                .cornerRadius(15.0)
            }
            .padding()
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                self.authenticationDidFail = true
                self.alert.toggle()
            }else{
                print("Success")
                withAnimation {viewRouter.currentPage = .homePage}
                self.authenticationDidFail = false
            }
        }
    }
}

struct LoginViewController_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewController().environmentObject(ViewRouter())
    }
}

struct EmailTextField: View {
    @Binding var email: String
    var body: some View {
        TextField("Email", text: $email)
            .padding()
            .background(Color("b"))
            .cornerRadius(5.0)
            .overlay(RoundedRectangle (cornerRadius: 10).strokeBorder(Color("c"), lineWidth: 2))
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(Color("b"))
            .cornerRadius(5.0)
            .overlay(RoundedRectangle (cornerRadius: 10).strokeBorder(Color("c"), lineWidth: 2))
            .padding(.bottom, 100)
    }
}
