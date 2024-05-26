//
//  MockedCountry.swift
//  ARTMProject
//
//  Created by Bechir Belkahla on 24/5/2024.
//

import Foundation

class MockedPreview {
    static let shared = MockedPreview()
    
    func mockedNativeName() -> NativeName {
        return NativeName(official: "official", common: "common")
    }
    
    func mockedCountryName() -> CountryName {
        return CountryName(common: "common", official: "official", nativeName: ["nativeName":mockedNativeName()])
    }
    func mockedCountry() -> Country {
        return Country(name: mockedCountryName(), flag: "flag", continents: ["continents"], population: 100, capital: ["capital"])
    }
}
