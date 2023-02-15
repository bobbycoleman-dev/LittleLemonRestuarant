//
//  MenuView.swift
//  LittleLemonRestaurant
//
//  Created by Bob Coleman on 2/15/23.
//

import SwiftUI

struct MenuView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        
        VStack {
            HeaderHeroView()
            
            List {
               
            }
            
        }
        .onAppear(perform: getMenuData)
        
    }
    
    func getMenuData() {
        let menuItemAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let menuUrl = URL(string: menuItemAddress)!
        let request = URLRequest(url: menuUrl)
        let task = URLSession.shared.dataTask(with: request) {data,_,_ in
            if let data = data {
                let decoder = JSONDecoder()
                let menu = try? decoder.decode(MenuList.self, from: data)
                menu?.menu.forEach {_ in
                    
                }
            }
        }
        task.resume()
        
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
