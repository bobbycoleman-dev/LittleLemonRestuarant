//
//  MenuItemModel.swift
//  LittleLemonRestaurant
//
//  Created by Bob Coleman on 2/15/23.
//

import Foundation

struct MenuItem: Decodable {
    let title: String
    let image: String
    let price: String
    let itemDescription: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case image = "image"
        case price = "price"
        case itemDescription = "description"
    }
}
