//
//  CartView.swift
//  UI-160
//
//  Created by にゃんにゃん丸 on 2021/04/13.
//

import SwiftUI

struct CartView: View {
    @StateObject var cartVM = CartViewModel()
    @Namespace var animation
    var body: some View {
        ZStack(alignment:.bottom){
            
            VStack{
                
                
                HStack{
                    
                    NavigationLink(destination: Home()) {
                        
                        Image(systemName: "rectangle.3.offgrid.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                        
                    }
                    
                       
                
                    
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "bag.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.purple)
                            .clipShape(Circle())
                            .overlay(
                                Text("\(cartVM.cartItems)")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color.orange)
                                    .clipShape(Circle())
                                    .offset(x: 15, y: -10)
                                    .opacity(cartVM.cartItems != 0 ? 1 : 0)
                            
                            )
                            
                        
                    }
                }
                .padding()
                .overlay(
                
                Text("NIKE")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                )
                
                ScrollView{
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        
                        Text("Air Max")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        
                        Text("Nike")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                   
                            
                            Image("shoe")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal,30)
                               
                   
                        
                        
                        Text("Price")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        
                        Text("$120")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                        
                        
                    })
                    .padding(.horizontal)
                    .padding(.vertical,20)
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(20)
                    .overlay(
                    
                     Capsule()
                    .fill(Color.purple)
                    .frame(width: 4, height: 45)
                    .padding(.top,25)
                        
                        ,alignment: .topLeading
                    
                    )
                    .padding()
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            cartVM.showCart.toggle()
                        }
                    }
                    
                }
                
            }
            .blur(radius: cartVM.showCart ? 50 : 0)
            
            
            AddtoCart(animation: animation)
            .offset(y: cartVM.showCart ? cartVM.startAniamiton ? 500 : 0 : 500)
            .environmentObject(cartVM)
            
            if cartVM.startAniamiton{
                
                VStack{
                    
                    Spacer()
                    
                    
                    ZStack{
                        
                        
                        Color.green
                            .frame(width: cartVM.shoeAnimation ? 100 : getRect().width * 1.3, height: cartVM.shoeAnimation ? 100 : getRect().width * 1.3)
                        
                            .clipShape(Circle())
                            .opacity(cartVM.shoeAnimation ? 1 : 0)
                        
                        Image("shoe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .matchedGeometryEffect(id: "SHOE", in: animation)
                            .frame(width: 80, height: 80)
                    }
                    .offset(y:cartVM.saveCart ? 70 : -120)
                    .scaleEffect(cartVM.saveCart ? 0.6 : 1)
                    .onAppear(perform: {
                        
                        cartVM.perfromAnimations()
                        
                    })
                    
                    if !cartVM.saveCart{
                        Spacer()
                    }
                    
                    
                    Image(systemName: "bag\(cartVM.addItemtoCart ? ".fill" : "")")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(cartVM.addItemtoCart ? Color.purple : Color.pink)
                        .clipShape(Circle())
                        .offset(y: cartVM.showBag ? -50 : 300)
                }
                .frame(width: getRect().width)
                .offset(y: cartVM.endAniamiton ? 500 : 0)
                
                
                
            }
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color.black.opacity(0.04).ignoresSafeArea())
        .onChange(of: cartVM.endAniamiton) { (value) in
            if cartVM.endAniamiton{
                
                cartVM.restAll()
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

struct AddtoCart : View {
    @EnvironmentObject var cartVM : CartViewModel
    var animation : Namespace.ID
    var body: some View{
        
        VStack{
            
            HStack(spacing:15){
                
                if !cartVM.startAniamiton{
                    
                    
                    Image("shoe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal)
                        .matchedGeometryEffect(id: "SHOE", in: animation)
                }
                
                
                VStack(alignment: .trailing , spacing: 15) {
                    
                    Text("Air Max")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    Text("$120")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    
                }
            }
            .padding()
            
            
            Divider()
            
            Text("Select Size")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.vertical)
            
            let columns = Array(repeating: GridItem(.flexible(),spacing: 15), count: 4)
            
            LazyVGrid(columns: columns, spacing: 15, content: {
                
                ForEach(sizes,id:\.self){size in
                    
                    
                    Button(action: {
                        
                        withAnimation{
                            
                            cartVM.selectedSize = size
                        }
                        
                    }) {
                        
                        Text(size)
                            .fontWeight(.semibold)
                            .foregroundColor(cartVM.selectedSize == size ? .white : .black )
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(cartVM.selectedSize == size ? Color.orange : Color.black.opacity(0.06))
                            .cornerRadius(25)
                            
                            
                        
                    }
                    
                }
                
                
            })
            
            Button(action: {
                
                withAnimation(.easeOut(duration: 0.7)){
                    
                    cartVM.startAniamiton.toggle()
                }
                
            }) {
                
                Text("Add to Cart")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(cartVM.selectedSize == "" ? .black : .white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(cartVM.selectedSize == "" ? Color.black.opacity(0.3) : Color.green)
                    .cornerRadius(15)
                
            }
            .padding(.top)
            .disabled(cartVM.selectedSize == "")
            .opacity(cartVM.selectedSize == "" ? 0.6 : 1)
            
            
            
            
        }
        .padding()
        
        .background(Color.white.clipShape(CustomCorner(corner: [.topLeft,.topRight], radius: 35)))
        
    }
}
let sizes = ["23","26","28","30","32"]


struct CustomCorner : Shape {
    var corner : UIRectCorner
    var radius : CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
