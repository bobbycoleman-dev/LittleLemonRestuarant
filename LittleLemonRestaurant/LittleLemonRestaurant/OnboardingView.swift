//
//  OnboardingView.swift
//  LittleLemonRestaurant
//
//  Created by Bob Coleman on 2/14/23.
//

import SwiftUI

let userDefaultFirstName: String = "first name key"
let userDefultsLastName: String = "last name key"
let userDefaultsEmail: String = "email key"

struct OnboardingView: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var showAlert: Bool = false
    @State private var isEmailValid : Bool   = true
    
    var body: some View {
        VStack {
            
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Little Lemon")
                        .font(Font.custom("MarkaziText-SemiBold", size: 55, relativeTo: .largeTitle))
                        .foregroundColor(Color("PrimaryYellow"))
                    
                    HStack(alignment: .top) {
                        
                        VStack(alignment: .leading) {
                            Text("Chicago")
                                .font(Font.custom("MarkaziText-SemiBold", size: 45, relativeTo: .title))
                                .padding(.bottom, 10)
                                .foregroundColor(Color("HighlightGray"))
                            Text("We are a family owned Mediterranean, restuarant, focused on trditional recipes served with a modern twist.")
                                .font(Font.custom("Karla-Medium", size: 18))
                                .foregroundColor(Color("HighlightGray"))
                                .multilineTextAlignment(.leading)
                        }
                        Image("Hero image")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 175)
                            .cornerRadius(10)
                            .padding(.top, 15)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("PrimaryGreen"))
            }
            
            VStack {
                TextField("First Name...", text: $firstName)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .font(.headline)
                TextField("Last Name...", text: $lastName)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .font(.headline)
                TextField("Email...", text: $email)
                
//                TextField("email...", text: $email, onEditingChanged: { (isChanged) in
//                            if !isChanged {
//                                if self.textFieldValidatorEmail(self.email) {
//                                    self.isEmailValid = true
//                                } else {
//                                    self.isEmailValid = false
//                                    self.email = ""
//                                }
//                            }
//                        })
                
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .font(.headline)
                Spacer()
                Button {
                    if self.isEmailValid {
                        showAlert = true
                        
                    } else {
                        setUserDefaults()
                    }
                } label: {
                    Text("Register".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textfieldNotEmpty() ? Color.gray : Color("PrimaryGreen"))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .alert("Please enter First Name, Last Name, and Email to continue", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                }
                .disabled(textfieldNotEmpty())
            }
            .padding()
        }
    }
    
    private func setUserDefaults() {
        UserDefaults.standard.set(firstName, forKey: userDefaultFirstName)
        UserDefaults.standard.set(lastName, forKey: userDefultsLastName)
        UserDefaults.standard.set(email, forKey: userDefaultsEmail)

    }
    
    private func textfieldNotEmpty() -> Bool {
        if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
            return true
        }
        return false
    }
    
//    private func textFieldValidatorEmail(_ string: String) -> Bool {
//        if string.count > 100 {
//            return false
//        }
//        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
//        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
//        return emailPredicate.evaluate(with: string)
//    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
