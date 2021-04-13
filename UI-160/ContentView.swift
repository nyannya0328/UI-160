//
//  ContentView.swift
//  UI-160
//
//  Created by にゃんにゃん丸 on 2021/04/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{

            CartView()
        .navigationTitle("")
        .navigationBarHidden(true)

        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
