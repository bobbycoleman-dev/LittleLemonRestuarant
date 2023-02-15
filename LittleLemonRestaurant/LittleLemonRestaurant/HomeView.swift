//
//  HomeView.swift
//  LittleLemonRestaurant
//
//  Created by Bob Coleman on 2/15/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        TabView {
            
            MenuView()
                .tabItem {
                    Text("Menu")
                    Image(systemName: "list.dash")
                }
            UserProfileView()
                .tabItem {
                    Text("Profile")
                    Image(systemName: "square.and.pencil")
                }
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
