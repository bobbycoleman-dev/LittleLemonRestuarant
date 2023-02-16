//
//  MenuBreakdownView.swift
//  LittleLemonRestaurant
//
//  Created by Bob Coleman on 2/15/23.
//

import SwiftUI

struct MenuBreakdownView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Order for delivery!".capitalized)
                .font(Font.custom("Karla-Regular_Bold", size: 20))
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    Text("Starters")
                        .font(Font.custom("Karla-Regular_ExtraBold", size: 15))
                        .padding()
                        .background(Color("HighlightGray"))
                        .cornerRadius(20)
                        .foregroundColor(Color("PrimaryGreen"))
                    Text("Mains")
                        .font(Font.custom("Karla-Regular_ExtraBold", size: 15))
                        .padding()
                        .background(Color("HighlightGray"))
                        .cornerRadius(20)
                        .foregroundColor(Color("PrimaryGreen"))
                    Text("Deserts")
                        .font(Font.custom("Karla-Regular_ExtraBold", size: 15))
                        .padding()
                        .background(Color("HighlightGray"))
                        .cornerRadius(20)
                        .foregroundColor(Color("PrimaryGreen"))
                    Text("Drinks")
                        .font(Font.custom("Karla-Regular_ExtraBold", size: 15))
                        .padding()
                        .background(Color("HighlightGray"))
                        .cornerRadius(20)
                        .foregroundColor(Color("PrimaryGreen"))
                }
            }
        }
    }
}

struct MenuBreakdownView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBreakdownView()
    }
}
