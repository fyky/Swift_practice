//
//  ContentView.swift
//  MyJanken
//
//  Created by fyky on 2022/01/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Image("gu")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("ぐー")
            
            Button(action: {
                print("タップされたよ")
            }) {
                Text("じゃんけんをする")
            }
        }
        

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
