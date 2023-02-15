//
//  HomeView.swift
//  LittleLemonRestaurant
//
//  Created by Bob Coleman on 2/15/23.
//

import SwiftUI

struct HomeView: View {
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        
        TabView {
            
            MenuView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
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
