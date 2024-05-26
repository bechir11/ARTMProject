//
//  CountryListViewModel.swift
//  ARTMProject
//
//  Created by Bechir Belkahla on 24/5/2024.
//

import Foundation

class CountryListViewModel: ObservableObject {
    
    @Published var didFailToFetch: Bool = false
    @Published var groupedCountries: [Character: [Country]] = [:]
    
    var sortedKeys: [Character] = []
    var errorMessage: String?
    var didFinishFetching: Bool = false
    
    init() {
        getCountriesList()
    }
    
    func getCountriesList() {
        Task {
            do {
                let countries = try await APIService.shared.fetchData(url: APIRequest.allCountries, type: Country.self)
                await updateContries(with: countries)
            } catch ARTError.invalidURL {
                await didFail(with: ARTError.invalidURL)
            } catch ARTError.invalidResponse {
                await didFail(with: ARTError.invalidResponse)
            } catch ARTError.requestFailed {
                await didFail(with: ARTError.requestFailed)
            }
        }
    }
    
    @MainActor
    func updateContries(with countries: [Country]) {
        didFinishFetching = true
        self.groupedCountries = Dictionary(grouping: countries.sorted(), by: { $0.name.common.first ?? "#" })
        self.sortedKeys = groupedCountries.keys.sorted()
    }
    
    @MainActor
    func didFail(with error: ARTError) {
        errorMessage = error.localized
        didFailToFetch = true
    }
}
