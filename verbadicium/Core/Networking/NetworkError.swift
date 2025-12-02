//
//  NetworkError.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidResponse
    case httpError(code: Int, data: Data)
    case decodingError(Error)

    var errorDescription: String? {
        switch self {
        case .invalidResponse: return "Invalid response from server"
        case .httpError(_, _): return "HTTP error \\(code)"
        case .decodingError(_): return "Decoding error: \\(err.localizedDescription)"
        }
    }
}
