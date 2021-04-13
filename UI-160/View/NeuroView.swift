//
//  NeuroView.swift
//  UI-160
//
//  Created by にゃんにゃん丸 on 2021/04/12.
//

import SwiftUI
import Neumorphic


struct NeuroView: View {
    @State var text = ""
    var body: some View {
        VStack{
            
            HStack{
                
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.primary)
                
                TextField("Search", text: $text)
                
                   
            }
            .padding(.vertical,20)
            .padding(.horizontal,20)
            .background(
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .softInnerShadow(RoundedRectangle(cornerRadius: 30), darkShadow: Color.black.opacity(0.1), lightShadow: Color.white, spread: 0.3, radius: 2)
            
            
            )
            
            HStack{
                
                    
                    RoundedRectangle(cornerRadius: 20)
                     .fill(Color.Neumorphic.main)
                     .softOuterShadow()
                     .frame(width: 150, height: 150)
                        .overlay(
                        
                        
                            Image("p1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                        
                        )
                    
                RoundedRectangle(cornerRadius: 20)
                 .fill(Color.Neumorphic.main)
                    .softInnerShadow(RoundedRectangle(cornerRadius: 20))
                 .frame(width: 150, height: 150)
                    .overlay(
                    
                    
                        Image("p2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    
                    )
                    
                
                
                
                
                
                    
            }
            .padding()
            
            HStack{
                
                Circle()
                    .fill(Color.Neumorphic.main)
                    .softOuterShadow()
                    .frame(width: 150, height: 150)
                    .overlay(
                    
                    
                        Image("p3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    
                    )
                    
                
                Circle()
                    .fill(Color.Neumorphic.main)
                    .softInnerShadow(Circle())
                    .frame(width: 150, height: 150)
                    .overlay(
                    
                    
                        Image("p4")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    
                    )
                
            }
            
            Button(action: {}) {
                Image("p2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                
            }
            .softButtonStyle(RoundedRectangle(cornerRadius: 20))
            
            
            HStack{
                
                
                Button(action: {}) {
                    
                    Image(systemName: "heart.fill")
                    
                }
                .softButtonStyle(Circle())
                
                Spacer()
                
                Button(action: {}) {
                    
                    Image(systemName: "heart.fill")
                    
                }
                .softButtonStyle(Circle(), padding: 20, mainColor: .red, textColor: .white, darkShadowColor: .red, lightShadowColor: .blue, pressedEffect: .hard)
                
                
                
                
                
            }
            .padding(.horizontal)
            
            
        }
       
            
        
    }
}

struct NeuroView_Previews: PreviewProvider {
    static var previews: some View {
        NeuroView()
    }
}
