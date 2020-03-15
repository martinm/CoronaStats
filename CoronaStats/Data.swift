//
//  Data.swift
//  CoronaStats
//
//  Created by Martin Malinowski on 15/03/2020.
//  Copyright © 2020 Martin Malinowski. All rights reserved.
//

import SwiftUI

struct AllData: Codable, Identifiable {
    let id = UUID()
    var cases: Int
    var deaths: Int
    var recovered: Int
    
    init() {
        self.cases = 0
        self.deaths = 0
        self.recovered = 0
    }
}

class AllDataApi {
    func getPost(completion: @escaping (AllData) -> ()) {
        guard let url = URL(string: "https://corona.lmao.ninja/all") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let data = try! JSONDecoder().decode(AllData.self, from: data!)
            
            DispatchQueue.main.async {
                completion(data)
            }
            
        }
        .resume()
    }
}
