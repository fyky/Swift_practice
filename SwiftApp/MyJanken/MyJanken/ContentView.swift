//
//  ContentView.swift
//  MyJanken
//
//  Created by fyky on 2022/01/27.
//

import SwiftUI

struct ContentView: View {
    
    @State var answerNumber = 0
    
    var body: some View {
        
        VStack {
            
            if answerNumber == 0 {
                Text("これからじゃんけんします")
            } else if answerNumber == 1{
                Image("gu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("ぐー")
            } else if answerNumber == 2{
                Image("choki")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("ちょき")
            } else{
                Image("pa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("ぱー")
            }
            
            Button(action: {
                answerNumber = Int.random(in: 1...3)
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
