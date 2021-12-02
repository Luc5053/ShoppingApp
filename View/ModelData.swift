//
//  ModelData.swift
//  ShoppingApp
//
//  Created by Luc Kabamba on 2021-12-01.
//

import SwiftUI


// Model of Data...
struct ProductData: Identifiable {
    var id = UUID()
    var image : String
    var title : String
    var price : String
    
}
    
    var Items = [
        
        
        ProductData(image: "product", title: "Necklace", price: "kr 400 "),
        ProductData(image: "product1", title: "Necklace", price: "kr 800"),
        ProductData(image: "product2", title: "Necklace", price: "kr 1300"),
        ProductData(image: "product3", title: "Ring", price: "kr 560"),
        ProductData(image: "product4", title: "Bracelet", price: "kr 370"),
        ProductData(image: "product5", title: "Earrings", price: "kr 920"),
        ProductData(image: "product6", title: "Earrings", price: "kr 995"),
        ProductData(image: "product7", title: "Necklace", price: "kr 1100")
    ]

// Top scrolling Tab Button...
    var scroll_Tabs = ["Jewelery","Post card","Accessery"]
