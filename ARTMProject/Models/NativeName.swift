//
//  NativeName.swift
//  ARTMProject
//
//  Created by Bechir Belkahla on 24/5/2024.
//

import Foundation

struct NativeName: Codable, Equatable {
    let official: String
    let common: String
    
    init(official: String, common: String) {
        self.official = official
        self.common = common
    }
}
