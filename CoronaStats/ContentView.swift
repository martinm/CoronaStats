//
//  ContentView.swift
//  CoronaStats
//
//  Created by Martin Malinowski on 15/03/2020.
//  Copyright © 2020 Martin Malinowski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var allData: AllData = AllData()
    
    var body: some View {
        VStack {
            
            VStack {
                Text("\(allData.cases)")
                    .font(.largeTitle)
                Text("total cases")
            }
            HStack {
                VStack {
                    Text("\(allData.recovered)")
                        .font(.largeTitle)
                    Text("total recovered")
                }
                .foregroundColor(.green)
                Spacer()
                VStack {
                    Text("\(allData.deaths)")
                        .font(.largeTitle)
                    Text("total deaths")
                }
                .foregroundColor(.red)
            }
            .padding()
            
        }
        .onAppear() {
            AllDataApi().getPost { (data) in
                self.allData = data
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
