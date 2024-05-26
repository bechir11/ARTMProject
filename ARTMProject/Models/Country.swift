//
//  Country.swift
//  ARTMProject
//
//  Created by Bechir Belkahla on 24/5/2024.
//

import Foundation

struct Country: Codable, Equatable, Identifiable, Comparable {
    
#if DEBUG_MODE
    let id = UUID()
#endif
    let name: CountryName
    let flag: String
    let continents: [String]
    let population: Int
    let capital: [String]?
    
    init(name: CountryName, flag: String, continents: [String], population: Int, capital: [String]) {
        self.name        = name
        self.flag        = flag
        self.continents  = continents
        self.population  = population
        self.capital     = capital
    }
    
    // Custom Equatable implementation to ignore `id`
        static func ==(lhs: Country, rhs: Country) -> Bool {
            return lhs.name       == rhs.name &&
                   lhs.flag       == rhs.flag &&
                   lhs.continents == rhs.continents &&
                   lhs.population == rhs.population &&
                   lhs.capital    == rhs.capital
        }
    
    //Custom Comparable implmentation to create the dictionnary
    static func < (lhs: Country, rhs: Country) -> Bool {
        lhs.name.common < rhs.name.common
    }
}



