//
//  OkashiData.swift
//  MyApp
//
//  Created by fyky on 2022/01/27.
//

import Foundation

// お菓子データ検索用クラス
class OkashiData: ObservableObject {
    // JSONのデータ構造
    struct ResultJson: Codable {
        // JSONのitem内のデータ構造
        struct Item: Codable {
            let name: String?
            let url: URL?
            let image: URL?
        }
        
        let item: [Item]?ß
    }
    
    // web API検索用メソッド　第一引数：keyword 検索したいワード
    func searchOkashi(keyword: String) async {
        
        // デバッグエリアに出力
        print(keyword)
        
        // お菓子の検索キーワードをURLエンコードする
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            else {
                return
        }
        
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        
        print(req_url)
    }
}
