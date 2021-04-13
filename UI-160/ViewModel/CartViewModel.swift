//
//  CartViewModel.swift
//  UI-160
//
//  Created by にゃんにゃん丸 on 2021/04/13.
//

import SwiftUI

class CartViewModel: ObservableObject {
    
    @Published var showCart = false
    
    @Published var selectedSize = ""
    
    @Published var startAniamiton = false
    @Published var shoeAnimation = false
    
    @Published var showBag = false
    
    @Published var saveCart = false
    @Published var addItemtoCart = false
    @Published var endAniamiton = false
    
    @Published var cartItems = 0
    
    func perfromAnimations(){
        
        
        withAnimation(.easeOut(duration: 0.8)){
            
            shoeAnimation.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            
            withAnimation(.easeInOut){
                
                self.showBag.toggle()
            }
            
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            
            withAnimation(.easeInOut(duration: 0.5)){
                
                self.saveCart.toggle()
                
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
            
            
                
                self.addItemtoCart.toggle()
        
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
            
            
                
            withAnimation(.easeOut(duration: 0.5)){
                
                self.endAniamiton.toggle()
            }
        
            
        }
        
        
        
    }
    
    func restAll(){
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {[self] in
            
            
            withAnimation{showCart.toggle()}
            showCart = false
            startAniamiton = false
            endAniamiton = false
            addItemtoCart = false
            shoeAnimation = false
            selectedSize = ""
            saveCart = false
            cartItems += 1
             showBag = false
            
            
            
        }
    }
    
}

