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
    @State private var emailIsValid : Bool = true
    
    var body: some View {
        VStack {
            
            HeaderHeroView()
            
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
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .font(.headline)
                Spacer()
                Button {
                    validateEmail()
                } label: {
                    Text("Register".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textfieldNotEmpty() ? Color.gray : Color("PrimaryGreen"))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .onChange(of: email) { newValue in
                    if(newValue.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {
                        self.emailIsValid = true
                    } else {
                        self.emailIsValid = false
                    }
                }
                .alert("Email is invalid. Please enter a valid email.", isPresented: $showAlert) {
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
    
    private func validateEmail() {
        if !self.emailIsValid {
            showAlert = true
        } else {
            setUserDefaults()
        }
    }

}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
