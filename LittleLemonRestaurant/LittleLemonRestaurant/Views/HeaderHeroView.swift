//
//  HeaderHeroView.swift
//  LittleLemonRestaurant
//
//  Created by Bob Coleman on 2/15/23.
//

import SwiftUI

struct HeaderHeroView: View {
    var body: some View {
        
        VStack {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: 50)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Little Lemon")
                    .font(Font.custom("MarkaziText-SemiBold", size: 55, relativeTo: .largeTitle))
                    .foregroundColor(Color("PrimaryYellow"))
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading) {
                        Text("Chicago")
                            .font(Font.custom("MarkaziText-SemiBold", size: 45, relativeTo: .title))
                            .foregroundColor(Color("HighlightGray"))
                        Text("We are a family owned Mediterranean, restuarant, focused on trditional recipes served with a modern twist.")
                            .font(Font.custom("Karla-Regular_Medium", size: 18))
                            .foregroundColor(Color("HighlightGray"))
                            .multilineTextAlignment(.leading)
                    }
                    Image("Hero image")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 175)
                        .cornerRadius(10)
//                        .padding(.top, 15)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("PrimaryGreen"))
        }
        
    }
}

struct HeaderHeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderHeroView()
    }
}
