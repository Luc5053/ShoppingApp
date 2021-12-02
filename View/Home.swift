//
//  Home.swift
//  ShoppingApp
//
//  Created by Luc Kabamba on 2021-12-01.
//

import SwiftUI

struct Home: View {
    
    @State var selectedTab = scroll_Tabs[0]
    @Namespace var animation
    @State var show = false
    @State var selectedItem : ProductData!
    
    var body: some View {
        ZStack{
            
            VStack(spacing: 0){
                
                ZStack {
                    HStack(spacing: 15){
                        
                        Button(action: {
                            
                        }) {
                            
                            Image(systemName: "line.horizontal.3.decrease")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            
                        }) {
                            
                            Image(systemName: "magnifyingglass")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
                            
                            Button(action: {
                                
                            }) {
                                
                                Image(systemName: "cart")
                                    .font(.title)
                                    .foregroundColor(.black)
                            }
                            Circle()
                                .fill(.red)
                                .frame(width: 15, height: 15)
                                .offset(x: 5, y: -10)
                        })
                    }
                    
                    Text("Shop")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    
                }
                    .padding()
                    .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(.white)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical,showsIndicators: false, content: {
                    
                    VStack{
                        
                        HStack{
                            
                            Text("Items")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top,10)
                        .padding(.bottom,10)
                        
                        ScrollView(.horizontal,showsIndicators: false, content: {
                            
                            HStack(spacing: 10){
                                
                                ForEach(scroll_Tabs,id: \.self){tab in
                                    
        //                            Tab Button...
                                    
                                    TabButton(title: tab, selectedTab: $selectedTab, animation: animation)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top, 10)
                            
                        })
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing:15), count: 2),spacing: 15){
                            
                            ForEach(Items){item in
                                
                                ItemsView(itemData: item, animation: animation)
                                    .onTapGesture {
                                        
                                        withAnimation(.easeIn){
                                            
                                            selectedItem = item
                                            show.toggle()
                                        }
                                    }
                            }
                
                        }
                    }
                    .padding()
                    .padding(.top,10)
                    
                })
            }
            .background(Color.black.opacity(0.05)).ignoresSafeArea(.all, edges: .all)
            
            if selectedItem != nil && show{
                
                DetailView(itemData: $selectedItem, show: $show, animation: animation)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        
    }
}

