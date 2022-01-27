//
//  ContentView.swift
//  MyTimer
//
//  Created by fyky on 2022/01/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                
                VStack(spacing: 30.0) {
                    Text("残り10秒")
                        .font(.largeTitle)
                    
                    HStack {
                        Button(action: {
                            
                        }) {
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width:140, height:140)
                                .background(Color("startColor"))
                                .clipShape(Circle())
                        }
                        
                        Button(action: {
                            
                        }) {
                            Text("ストップ")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("stopColor"))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            
            
            .toolbar {
                // ToolbarItemの位置を指定
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    // 遷移先をSettingViewに指定
                    NavigationLink(destination: SettingView()) {
                        Text("秒数設定")
                    }
                }
            }
        }
        // iPadへの対応
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
