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
            
            FetchedObjects() { (dishes: [Dish]) in
                List {
                    ForEach(dishes, id:\.self) { dish in
                        HStack {
                            
                        }
                    }
                }
            }
            
        }
        .onAppear(perform: getMenuData)
        
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        let menuItemAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let menuUrl = URL(string: menuItemAddress)!
        let request = URLRequest(url: menuUrl)
        let task = URLSession.shared.dataTask(with: request) {data,_,_ in
            if let data = data {
                let decoder = JSONDecoder()
                let menu = try? decoder.decode(MenuList.self, from: data)
                
                ForEach(menu)
                
                menu?.menu.forEach { _ in
                    let dish = Dish(context: viewContext)
                    dish.title = dish.title
                    dish.price = dish.price
                    dish.image = dish.image
                }
                try? viewContext.save()
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
