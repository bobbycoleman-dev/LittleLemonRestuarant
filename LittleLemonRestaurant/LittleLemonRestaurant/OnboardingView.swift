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
    
    var body: some View {
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
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .font(.headline)
            Button {
                if firstName.isEmpty && lastName.isEmpty && email.isEmpty {
                    showAlert = true
                } else {
                    setUserDefaults()
                }
            } label: {
                Text("Register".uppercased())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("PrimaryGreen"))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .alert("Please enter First Name, Last Name, and Email to continue", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
        }
        .padding()
    }
    
    private func setUserDefaults() {
        UserDefaults.standard.set(firstName, forKey: userDefaultFirstName)
        UserDefaults.standard.set(lastName, forKey: userDefultsLastName)
        UserDefaults.standard.set(email, forKey: userDefaultsEmail)

    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
