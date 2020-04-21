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

struct Country: Codable, Identifiable {
    let id = UUID()
    var country: String
    var cases: Int
    var todayCases: Int
    var deaths: Int
    var todayDeaths: Int
    var recovered: Int
    var critical: Int
}

class AllDataApi {
    func getData(completion: @escaping (AllData) -> ()) {
        guard let url = URL(string: "https://corona.lmao.ninja/v2/all") else {
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

class CountriesDataApi {
    func getData(completion: @escaping ([Country]) -> ()) {
        guard let url = URL(string: "https://corona.lmao.ninja/v2/countries") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let data = try! JSONDecoder().decode([Country].self, from: data!)
            
            DispatchQueue.main.async {
                completion(data)
            }
            
        }
        .resume()
    }
    
}
