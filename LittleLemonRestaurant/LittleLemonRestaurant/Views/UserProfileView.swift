//
//  UserProfileView.swift
//  LittleLemonRestaurant
//
//  Created by Bob Coleman on 2/15/23.
//

import SwiftUI

struct UserProfileView: View {
    
    @Environment(\.presentationMode) var presentation
    let firstName: String? = UserDefaults.standard.string(forKey: userDefaultFirstName)
    let lastName: String? = UserDefaults.standard.string(forKey: userDefultsLastName)
    let email: String? = UserDefaults.standard.string(forKey: userDefaultsEmail)
    let isLoggedIn: Bool? = UserDefaults.standard.bool(forKey: userDefaultsIsLoggedIn)
    
    var body: some View {
        
        ZStack {
            
            RadialGradient(gradient: Gradient(colors: [Color("HighlightGray"), Color("PrimaryYellow")]),
                           center: .topLeading,
                           startRadius: 5,
                           endRadius: UIScreen.main.bounds.height)
                .ignoresSafeArea()
            
            VStack {
                
                Text("Personal Information")
                    .font(Font.custom("Karla-Regular_ExtraBold", size: 25))
                
                Image("Profile")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 200)
                    
                
                
                Text("First Name")
                    .font(.subheadline)
                    .opacity(0.5)
                Text(firstName ?? "")
                    .font(Font.custom("Karla-Regular_Medium", size: 25))
                    .padding(.bottom, 10)
                Text("Last Name")
                    .font(.subheadline)
                    .opacity(0.5)
                Text(lastName ?? "")
                    .font(Font.custom("Karla-Regular_Medium", size: 25))
                    .padding(.bottom, 10)
                Text("Email")
                    .font(.subheadline)
                    .opacity(0.5)
                Text(email ?? "")
                    .font(Font.custom("Karla-Regular_Medium", size: 25))
                
                Spacer()
                
                Button {
                    UserDefaults.standard.set(false, forKey: userDefaultsIsLoggedIn)
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Text("Logout")
                        .font(Font.custom("Karla-Regular_Bold", size: 20))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("PrimaryGreen"))
                        .cornerRadius(10)
                        .foregroundColor(Color("HighlightGray"))
                }

            }
            .padding()
        }
        
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
