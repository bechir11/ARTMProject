//
//  Errors.swift
//  ARTMProject
//
//  Created by Bechir Belkahla on 24/5/2024.
//

import Foundation

enum ARTError: Error {
    case invalidURL
    case invalidResponse
    case requestFailed
    case decodingError
}

extension ARTError {
    var localized: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .requestFailed:
            return "Request Failed"
        case .decodingError:
            return "Decoding Error"
        }
    }
}
