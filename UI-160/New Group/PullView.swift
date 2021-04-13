//
//  PullView.swift
//  UI-160
//
//  Created by にゃんにゃん丸 on 2021/04/12.
//

import SwiftUI

struct PullView: View {
    @State var arrayData = ["jacob Degrom1","jacob Degrom2","jacob Degrom3","jacob Degrom4","jacob Degrom5"]
    
    @State var reflesh = Reflesh(started: false, released: false)
    
    
    var body: some View {
        VStack(spacing:0){//大元のSpacingを0にすることで埋まる
            
            HStack{
                
              
                Text("Jacob Degrom\nNY METS")
                
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.purple)
                    .padding()
                    .multilineTextAlignment(.center)
                   
                    .shadow(color: Color.blue, radius: 3, x: 15, y: 20)
                
                Spacer()
            }
            .padding()
            .padding(.top,getSafeArea().top)
            .background(Color.white)
            
            Divider()
            
         
               
           
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                
                GeometryReader{reader -> AnyView in
                    
                    let minY = reader.frame(in:.global).minY
                    
                    
                    
                    DispatchQueue.main.async {
                        
                        if reflesh.startoffset == 0{
                            
                            reflesh.startoffset = minY
                        }
                        reflesh.offset = minY
                        
                        if reflesh.offset - reflesh.startoffset > 80 && !reflesh.started{
                          
                            
                            reflesh.started = true
                            
                        }
                        
                        if reflesh.startoffset == reflesh.offset && reflesh.started && !reflesh.released{
                            
                            withAnimation(Animation.linear(duration: 0.3)){ reflesh.released = true}
                            updateDate()
                            
                        }
                        
                        if reflesh.startoffset == reflesh.offset && reflesh.started && !reflesh.released && reflesh.invaild{
                            
                            reflesh.invaild = false
                            updateDate()
                            
                            
                            
                        }
                        
                    }
                    
                    
                    return AnyView(
                        Color.black.opacity(0.3)
                            .frame(width: 0, height: 0)
                    
                    )
                    
                }
                .frame(width: 0, height: 0)
                
                
                
                ZStack(alignment: .top) {
                    
                    
                    
                    
                    
                    
                    if reflesh.started && reflesh.released{
                        
                        
                        ProgressView()
                            .offset(y: -35)
                    }
                    else{
                        
                        Image(systemName: "arrow.down")//このままだと表示されないのでoffset
                            .font(.system(size: 22))
                            .foregroundColor(.gray)
                            .rotationEffect(.init(degrees: reflesh.started ? 180 : 0))
                            .offset(y: -25)
                            .animation(.easeIn)
                    }
                        
                    
                    
                    VStack{
                        
                        ForEach(arrayData,id:\.self){value in
                            
                            HStack{
                                
                                Text(value)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                
                            }
                            .padding()
                            
                            
                            
                            
                        }
                    }
                    .background(Color.white)//ここのBACKを指定することで差が生まれる
                    
                    
                    
                    
                    
                }
                .offset(y:reflesh.released ? 40 : -10)//zのoffsetで上にいく
                
            }
            
        }
        .ignoresSafeArea()
        .background(Color.gray.opacity(0.3).ignoresSafeArea())
       
            
    }
    
    func updateDate(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            
            withAnimation(Animation.linear){
                
                if reflesh.startoffset == reflesh.offset{
                    arrayData.append("JAKE")
                    reflesh.released = false
                    reflesh.started = false
                    
                    
                }
                else{
                    
                    reflesh.invaild = true
                }
                
                
            }
            
            
        }
        
        
        
    }
}

struct PullView_Previews: PreviewProvider {
    static var previews: some View {
        PullView()
    }
}

extension View {
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

struct Reflesh {
    var startoffset : CGFloat = 0
    var offset : CGFloat = 0
    var started : Bool
    var released : Bool
    var invaild : Bool = false
    
    
}
