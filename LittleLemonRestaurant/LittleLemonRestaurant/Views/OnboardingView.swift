//
//  OnboardingView.swift
//  LittleLemonRestaurant
//
//  Created by Bob Coleman on 2/14/23.
//

let userDefaultFirstName: String = "first name key"
let userDefultsLastName: String = "last name key"
let userDefaultsEmail: String = "email key"
let userDefaultsIsLoggedIn: String = "bool key"

import SwiftUI

struct OnboardingView: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var showAlert: Bool = false
    @State private var emailIsValid : Bool = true
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                HeaderHeroView()
                
                VStack {
                    
                    NavigationLink(destination: HomeView(), isActive: $isLoggedIn) {
                        EmptyView()
                    }


                    
                    TextField("First Name...", text: $firstName)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                        .font(.headline)
                    TextField("Last Name...", text: $lastName)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                        .font(.headline)
                    TextField("Email...", text: $email)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
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
            .onAppear() {
                if UserDefaults.standard.bool(forKey: userDefaultsIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
    }
    
    private func setUserDefaults() {
        UserDefaults.standard.set(self.firstName, forKey: userDefaultFirstName)
        UserDefaults.standard.set(self.lastName, forKey: userDefultsLastName)
        UserDefaults.standard.set(self.email, forKey: userDefaultsEmail)
        UserDefaults.standard.set(self.isLoggedIn, forKey: userDefaultsIsLoggedIn)
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
            isLoggedIn = true
            setUserDefaults()
        }
    }

}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
