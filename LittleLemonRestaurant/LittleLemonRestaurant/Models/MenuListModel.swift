//
//  MenuListModel.swift
//  LittleLemonRestaurant
//
//  Created by Bob Coleman on 2/15/23.
//

import Foundation

struct MenuList: Decodable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}
