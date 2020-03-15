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
            AllDataApi().getPost { (data) in
                self.allData = data
            }
            
            CountriesDataApi().getPost { (data) in
                self.countries = data
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
