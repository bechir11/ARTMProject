//
//  CountryView.swift
//  ARTMProject
//
//  Created by Bechir Belkahla on 24/5/2024.
//

import SwiftUI

struct CountryDetailView: View {
    
    var country: Country
    
    var body: some View {
        VStack {
            detailRow(title: "Name", content: country.name.common)
            detailRow(title: "Flag", content: country.flag)
            detailRow(title: "continent", content: country.continents.joined(separator: ", ") )
            detailRow(title: "nombre de la population", content: country.population.formatted())
            if let capitals = country.capital {
                detailRow(title: "capitale", content: capitals.joined(separator: ", "))
            }
        }
        .navigationTitle(country.name.common)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    fileprivate func detailRow(title: String, content: String) -> some View {
        HStack {
            Text("\(title): ")
                .bold()
            Text(content)
        }
        .padding()
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        //Using mocked data for the preview
        CountryDetailView(country: MockedPreview.shared.mockedCountry())
    }
}
