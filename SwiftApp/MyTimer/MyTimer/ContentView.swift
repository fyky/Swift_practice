//
//  ContentView.swift
//  MyTimer
//
//  Created by fyky on 2022/01/27.
//

import SwiftUI

struct ContentView: View {
    // ? 存在していたら
    @State var timerHandler : Timer?
    
    @State var count = 0
    
    @AppStorage("timer_value") var timerValue = 10
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                
                VStack(spacing: 30.0) {
                    Text("残り\(timerValue - count)秒")
                        .font(.largeTitle)
                    
                    HStack {
                        Button(action: {
                            startTimer()
                            
                        }) {
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width:140, height:140)
                                .background(Color("startColor"))
                                .clipShape(Circle())
                        }
                        
                        Button(action: {
                            if let unwrapedTimerHandler = timerHandler {
                                if unwrapedTimerHandler.isValid == true {
                                    unwrapedTimerHandler.invalidate()
                                }
                            }
                            
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
            
            .onAppear {
                count = 0
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
    func countDownTimer() {
        count += 1
        
        if timerValue - count <= 0 {
            timerHandler?.invalidate()
        }
    }
    
    func startTimer() {
        // アンラップ
        if let unwrapedTimerHandler = timerHandler {
            if unwrapedTimerHandler.isValid == true {
                // 何も実行しない
                return
            }
        }
        
        if timerValue - count <= 0 {
            count = 0
        }
        
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
             _ in
            countDownTimer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
