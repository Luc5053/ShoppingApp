//
//  ItemsView.swift
//  ShoppingApp
//
//  Created by Luc Kabamba on 2021-12-01.
//

import SwiftUI

struct ItemsView: View {
    
    var itemData : ProductData
    var animation : Namespace.ID
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 6){
            
            ZStack{
                
//                Both image and name are the same...
                Color(itemData.image)
                    .cornerRadius(15)
                
                Image(itemData.image)
                    .resizable()
                    .cornerRadius(15)
                    .aspectRatio(contentMode: .fit)
                    .padding(5)
                    .matchedGeometryEffect(id: itemData.image, in: animation)
                
            }
            .padding(.horizontal)
            Text(itemData.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .padding(.leading, 50.0)
            
            Text(itemData.price)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .padding(.leading, 50.0)
        }
    }
}

