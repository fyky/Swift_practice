//
//  ContentView.swift
//  MyApp
//
//  Created by fyky on 2022/01/26.
//

import SwiftUI

struct ContentView: View {
    // OkashiDataを参照する状態変数
    @StateObject var okashiDataList = OkashiData()
    
    // 入力された文字列を保持する状態変数
    @State var inputText = ""
    
    var body: some View {
        VStack {
            // 文字列を受け取るTextFieldを表示
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
                .onSubmit {
                    // Taskは非同期で処理を実行できる
                    Task{
                        // 入力完了直後に検索する
                        await okashiDataList.searchOkashi(keyword: inputText)
                    }
                }
            
                .submitLabel(.search)
            
                .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
