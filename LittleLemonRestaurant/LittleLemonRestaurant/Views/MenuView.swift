//
//  MenuView.swift
//  LittleLemonRestaurant
//
//  Created by Bob Coleman on 2/15/23.
//
import Foundation
import SwiftUI

struct MenuView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                HeaderHeroView()
                MenuBreakdownView()
                TextField("\(Image(systemName: "magnifyingglass"))Search menu", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding(5)
                FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id:\.self) { dish in
                            NavigationLink {
                                ItemDescriptionView(title: dish.title ?? "", description: dish.itemDescription ?? "", price: dish.price ?? "", image: dish.image ?? "")
                            } label: {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("\(dish.title ?? "title")")
                                        .font(Font.custom("Karla-Regular_Bold", size: 20))
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("\(dish.itemDescription ?? "Description")")
                                                .font(Font.custom("Karla-Regular_Light", size: 15))
                                                .lineLimit(2)
                                                .padding(.bottom, 2)
                                            Text("$\(dish.price ?? "price").00")
                                                .font(Font.custom("Karla-Regular_ExtraLight", size: 20))
                                        }
                                        AsyncImage(url: URL(string: dish.image ?? "image")) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 80, height: 80)
                                    }
                                    .padding(.top, 3)
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .onAppear(perform: getMenuData)
        }
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
                menu?.menu.forEach { dish in
                    let item = Dish(context: viewContext)
                    item.title = dish.title
                    item.price = dish.price
                    item.image = dish.image
                    item.itemDescription = dish.itemDescription
                    
                    print("\(dish.title)")
                }
                try? viewContext.save()
            }
        }
        task.resume()
    }
    
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(key: "title",
                             ascending: true,
                             selector: #selector(NSString.localizedStandardCompare))
        ]
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
    
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
