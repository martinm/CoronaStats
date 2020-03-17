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
    @State var countries: [Country] = []
    @State var formatter = DateFormatter()
    @State var lastUpdateDate = ""

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
            
            HStack() {
            Button(action: {
                self.loadData()
            }) {
                Text("last updated: \(lastUpdateDate)")
                Image(systemName: "arrow.clockwise")
            }
                .padding(.leading, 15)
                Spacer()
            }

            List(countries) { country in
                VStack(alignment: .leading) {
                        Text(country.country)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                    HStack {
                        VStack {
                            Text("\(country.cases)")
                            Text("cases")
                        }
                        Spacer()
                        VStack {
                            Text("\(country.recovered)")
                            Text("recovered")
                        }
                        .foregroundColor(.green)
                        Spacer()
                        VStack {
                            Text("\(country.critical)")
                            Text("critical")
                        }
                        .foregroundColor(.orange)
                        Spacer()
                        VStack {
                            Text("\(country.deaths)")
                            Text("deaths")
                        }
                        .foregroundColor(.red)
                    }
                }
            }
        }
        .onAppear() {
            self.loadData()
        }
    }
    
    func loadData() {
        self.formatter.timeStyle = .medium
        self.lastUpdateDate = self.formatter.string(from: Date())
        AllDataApi().getData { (data) in
            self.allData = data
        }
        
        CountriesDataApi().getData { (data) in
            self.countries = data
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
