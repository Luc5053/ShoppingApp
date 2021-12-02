//
//  TabButton.swift
//  ShoppingApp
//
//  Created by Luc Kabamba on 2021-12-01.
//

import SwiftUI

struct TabButton: View {
    
    var title : String
    
    @Binding var selectedTab : String
    
    var animation : Namespace.ID
    
    var body: some View {
         
        Button(action: {
            
            withAnimation(.spring()){selectedTab = title}
            
        }) {
            
            VStack(alignment: .leading, spacing: 6, content: {
                
                Text(title)
                    .fontWeight(.heavy)
                    .foregroundColor(selectedTab == title ? .black : .gray)
                    
                
//                Adding animation...
                
                if selectedTab == title{
                    
                    Capsule()
                        .fill()
                        .frame(width: 80, height: 4)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                }
            })
            
//            Default width...
                .frame(width: 100)
        }
    }
}
