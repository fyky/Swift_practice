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
            Spacer()
            
            if answerNumber == 0 {
                Text("これからじゃんけんします")
                    .padding(.bottom)
                
            } else if answerNumber == 1{
                Image("gu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Text("ぐー")
                    .padding(.bottom)
            } else if answerNumber == 2{
                Image("choki")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Text("ちょき")
                    .padding(.bottom)
            } else{
                Image("pa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Text("ぱー")
                    .padding(.bottom)
            }
            
            Button(action: {
                // 新しいじゃんけんの結果を一時的に格納する変数を設ける
                var newAnswerNumber = 0
                
                // 繰り返し
                repeat {
                    newAnswerNumber = Int.random(in: 1...3)
                } while answerNumber == newAnswerNumber
                // while 繰り返す条件　〜になるまで
                
                answerNumber = newAnswerNumber
                
            }) {
                Text("じゃんけんをする")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
                    
            }
        }
        

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
