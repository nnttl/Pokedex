//
//  NetworkError.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingFailed
    case serverError(Int)
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid server response"
        case .decodingFailed:
            return "Failed to decode data"
        case .serverError(let code):
            return "Server error with code: \(code)"
        }
    }
}
