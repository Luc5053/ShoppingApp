//
//  DetailView.swift
//  ShoppingApp
//
//  Created by Luc Kabamba on 2021-12-01.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var itemData : ProductData!
    @Binding var show: Bool
    var animation : Namespace.ID
//    Initialization...
    @State var selectedColor = Color.red
    
    @State var count = 0
    
    @State var isSmallDivice = UIScreen.main.bounds.height < 750
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                VStack(alignment: .leading,spacing: 2){
                    
                    Button(action: {
                        
                        withAnimation(.easeOut){show.toggle()}
                        
                    }) {
                        
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Text("Jewelery details ")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top)
                    
                    Text(itemData.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {}) {
                    
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)
                }

            }
            .padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            HStack(spacing: 100){
                
                VStack(alignment: .leading, spacing: 6){
                    
                    Text("Price")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(itemData.price)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)

                    
                }
                .padding([.top, .leading, .bottom])
                
                Image(itemData.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.trailing, 10.0)
                    .cornerRadius(15)
//                Hero Animation...
                    .matchedGeometryEffect(id: itemData.image, in: animation)
            }
            .padding()
            .padding(.top,10)
            .zIndex(1)
            
            VStack{
                
                ScrollView(isSmallDivice ? .vertical : .init(), showsIndicators: false) {
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 8){
                            
                            Text("Color")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            HStack(spacing:15){
                                
                                ColorButton(color:Color.red, selectedColor: $selectedColor)
                                
                                ColorButton(color:Color.yellow, selectedColor: $selectedColor)
                                
                                ColorButton(color:Color.green, selectedColor: $selectedColor)
                                
                            }
                        }
                        .padding(.all)
                        
                        Spacer(minLength: 0)
                        
                        VStack(alignment: .leading, spacing: 8){
                            
                            Text("Size")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Text("12 cm")
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                        .padding(.all)
                    }
                    .padding(.horizontal)
                    .padding(.top,isSmallDivice ? -20 : -20)
                    
                    Text("A kiss is a lovely trick designed by nature to stop speech when words become superfluous.  Love consists of looking outwardly in the same direction.")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                    
                    HStack(spacing: 10){
                        
                        Button(action: {
                            if count > 0{count -= 1}
                        }) {
                            
                            Text("-")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.white,lineWidth: 1))
                        }
                        
                        Text("\(count)")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Button(action: {count += 1}) {
                            
                            Text("+")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.white,lineWidth: 1))
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            
                            Image(systemName: "suit.heart.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.red)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        
                        Text("BUY NOW")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
    //                        .background(Color(itemData.image))
                            .background(.gray)
                            .clipShape(Capsule())
                    }
                    .padding(.top)
                    .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : 0)
                }
                
            }
            .background(
                Color.gray
                    .clipShape(CustomCorner())
                    .padding(.top,isSmallDivice ? -50 : -50)
            )
            .zIndex(0)
        }
        .background(Color(itemData.image).ignoresSafeArea(.all,edges: .top))
        .background(Color.white.ignoresSafeArea(.all,edges: .bottom))
        .onAppear{
            
//            First color is image or item color
            selectedColor = Color(itemData.image)
//            selectedColor = Color.gray
        }
    }
}
