//
//  Home.swift
//  UI-160
//
//  Created by にゃんにゃん丸 on 2021/04/12.
//

import SwiftUI

struct Home: View {
    @StateObject var HearVM = HearderViewModel()
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    
    
    var body: some View {

        
        ZStack(alignment: .top) {
            HeaderView()
                
                .zIndex(1)
                .offset(y: HearVM.hederOffset)
            
            
            
            ScrollView(.vertical, showsIndicators: false) {

                VStack(spacing:15){

                    ForEach(1...5,id:\.self){index in

                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: getRect().width - 30, height: 250)
                            .cornerRadius(1)
                        
                        HStack(spacing:10){
                            
                            Image("p1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())
                            
                            
                            VStack(alignment: .leading, spacing: 1) {
                                
                                Text("Lion King")
                                   
                                    .fontWeight(.heavy)
                                    .foregroundColor(.blue)
                                    .kerning(1.3)
                                
                                Text("我はおうだよ")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.purple)
                                    .kerning(1.2)
                                
                            }
                            
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)//これで位置が合う
                        .padding(.bottom,15)
                        
                        


                    }
                }
                .padding(.top,70)//vの終わり　ズレているので修正
                .overlay(
                
                    GeometryReader{proxy -> Color in
                        
                        let minY = proxy.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            
                            if HearVM.startMinY == 0{
                                
                                HearVM.startMinY = minY
                                
                            }
                            
                            let offset = HearVM.startMinY - minY
                            
                            if offset > HearVM.offset{
                                
                                HearVM.bottomScrolloffset = 0
                                
                                if HearVM.topScrolloffset == 0{
                                    
                                    HearVM.topScrolloffset = offset
                                    
                                }
                                
                                let progress = (HearVM.topScrolloffset + getmaxOffset()) - offset
                                
                                
                                let offsetCondition = (HearVM.topScrolloffset + getmaxOffset()) >= getmaxOffset() && getmaxOffset() - progress <= getmaxOffset()
                                
                                let hearderoffset = offsetCondition ? -(getmaxOffset() - progress) : -getmaxOffset()
                                
                                HearVM.hederOffset = hearderoffset
                                
                                
                                
                            }
                            
                            if offset < HearVM.offset{
                                
                                HearVM.topScrolloffset = 0
                                if HearVM.bottomScrolloffset == 0{
                                    
                                    HearVM.bottomScrolloffset = offset
                                }
                                
                                withAnimation(.easeOut){
                                    
                                    
                                    
                                    let hearderoffset = HearVM.hederOffset
                                    
                                    HearVM.hederOffset = HearVM.bottomScrolloffset > offset + 40 ? 0 : (hearderoffset != -getmaxOffset() ? 0 : hearderoffset)
                                }
                                
                                
                                
                            }
                            HearVM.offset = offset
                            
                        }
                        
                        
                        return Color.clear
                    }
                    .frame(height: 0)
                    ,alignment: .top
                
                )

            }
           
            
        }
       
      
      
      
    }
    func getmaxOffset()->CGFloat{
        
        return HearVM.startMinY + (getSafeArea().top) + 10
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
   
    }
}

struct HeaderView : View {
    @Environment(\.colorScheme) var scheme
    @State var show = false
    var body: some View{
        
        
        HStack(spacing:20){
            
            Image("you")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Text("You Tube")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .kerning(0.5)
                .offset(x: -10)//近づけるため
            
            Spacer()
            
            
            Button(action: {}) {
                Image(systemName: "display")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            
            Button(action: {}) {
                Image(systemName: "display")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            
           
               
            NavigationLink(destination: PullView()) {
                
                Image(systemName: "display")
                    .font(.title2)
                    .foregroundColor(.primary)
                
            }
                
         
                
                        
                          
                         
         
         
              
           
            
            
            NavigationLink(destination: NeuroView()) {
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
            }
            
               
          
            
        }
        .padding(.horizontal)
        .padding(.vertical,8)
        .background((scheme == .dark ? Color.black : Color.white).ignoresSafeArea(.all, edges: .top))
        .overlay(
        //overを使って入れる
        Divider()
            .background(Color.primary)
            
            ,alignment: .bottom
        )
       
    }
}
