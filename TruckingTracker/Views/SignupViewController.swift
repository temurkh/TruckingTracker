//
//  SignupViewController.swift
//  TruckingTracker
//
//  Created by Temur Khusanboev on 4/7/21.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignupViewController: View {
    
    @EnvironmentObject var viewRouter2: ViewRouter2
    
    @State var email: String = ""
    @State var password: String = ""
    @State var repass: String = ""
    
    @State var error = ""
    @State var alert = ""
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Email")
                    .bold()
                    .font(.title3)
                    .padding(.trailing,260)
                    .frame(alignment: .leading)
                    .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
                TextField("Email", text: $email)
                    .padding()
                    .background(Color("b"))
                    .cornerRadius(5.0)
                    .overlay(RoundedRectangle (cornerRadius: 10).strokeBorder(Color("c"), lineWidth: 2))
                    .padding(.bottom, 20)
                Text("Password")
                    .bold()
                    .font(.title3)
                    .padding(.trailing,225)
                    .frame(alignment: .leading)
                    .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color("b"))
                    .cornerRadius(5.0)
                    .overlay(RoundedRectangle (cornerRadius: 10).strokeBorder(Color("c"), lineWidth: 2))
                    .padding(.bottom, 20)
                Text("Password Confirm")
                    .bold()
                    .font(.title3)
                    .padding(.trailing,145)
                    .frame(alignment: .leading)
                    .foregroundColor(Color(hue: 0.685, saturation: 0.975, brightness: 0.287))
                SecureField("Repeat Password", text: $repass)
                    .padding()
                    .background(Color("b"))
                    .cornerRadius(5.0)
                    .overlay(RoundedRectangle (cornerRadius: 10).strokeBorder(Color("c"), lineWidth: 2))
                    .padding(.bottom, 40)
                Button(action: {self.signup()}) {
                    Text("SIGN UP")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.blue)
                .cornerRadius(15.0)
            }
            .padding()
            .offset(y: -60)
        }
    }
    
    func signup(){
        
        if self.email != ""{
            
            if self.password == self.repass{
                
                Auth.auth().createUser(withEmail: self.email, password: self.repass) { (res, err) in
                    
                    if err != nil{
                        self.error = err!.localizedDescription
//                        self.alert.toggle()
                        return
                    }
                    
                    print("success")
                    withAnimation {viewRouter2.currentPage = .homePage}
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            }
            else{
                
                self.error = "Password mismatch"
//                self.alert.toggle()
            }
        }
        else{
            
            self.error = "Please fill all the contents properly"
//            self.alert.toggle()
        }
    }
}

struct SignupHome: View {
    var body: some View {
        NavigationLink(
            destination: HomeViewController(),
            label: {
                Text("SIGNUP")
            })
    }
}

struct SignupViewController_Previews: PreviewProvider {
    static var previews: some View {
        SignupViewController().environmentObject(ViewRouter())
    }
}
