////
////  MenuViewViewModel.swift
////  LittleLemonRestaurant
////
////  Created by Bob Coleman on 2/15/23.
////
//
//import Foundation
//import SwiftUI
//import CoreData
//
//class MenuViewViewModel: ObservableObject {
//
//    let persistenceController = PersistenceController.shared
//    @Environment(\.managedObjectContext) private var viewContext
//    @Binding var searchText = ""
//
//    init() {
//        getMenuData()
//
//    }
//    
//    func getMenuData() {
//        PersistenceController.shared.clear()
//        let menuItemAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
//        let menuUrl = URL(string: menuItemAddress)!
//        let request = URLRequest(url: menuUrl)
//        let task = URLSession.shared.dataTask(with: request) {data,_,_ in
//            if let data = data {
//                let decoder = JSONDecoder()
//                let menu = try? decoder.decode(MenuList.self, from: data)
//                menu?.menu.forEach { dish in
//                    let item = Dish(context: self.viewContext)
//                    item.title = dish.title
//                    item.price = dish.price
//                    item.image = dish.image
//                    item.itemDescription = dish.itemDescription
//
//                    print("\(dish.title)")
//                }
//                try? self.viewContext.save()
//            }
//        }
//        task.resume()
//    }
//
//
//    func buildSortDescriptors() -> [NSSortDescriptor] {
//        return [
//            NSSortDescriptor(key: "title",
//                             ascending: true,
//                             selector: #selector(NSString.localizedStandardCompare))
//        ]
//    }
//
//    func buildPredicate() -> NSPredicate {
//        if searchText.isEmpty {
//            return NSPredicate(value: true)
//        } else {
//            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
//        }
//    }
//
//}
