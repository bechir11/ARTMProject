//
//  CountryName.swift
//  ARTMProject
//
//  Created by Bechir Belkahla on 24/5/2024.
//

import Foundation

struct CountryName: Codable, Equatable {
    let common: String
    let official: String
    let nativeName: [String: NativeName]?
    
    init(common: String, official: String, nativeName: [String: NativeName]) {
        self.common = common
        self.official = official
        self.nativeName = nativeName
    }
}
