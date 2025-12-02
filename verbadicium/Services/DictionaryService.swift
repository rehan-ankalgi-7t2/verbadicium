//
//  DictionaryService.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//

import Foundation

protocol DictionaryService {
    func fetchDefinitions(for word: String) async throws -> [WordDefinition]
}

final class DictionaryServiceImpl: DictionaryService {
    private let baseURL: URL
    private let client: APIClientProtocol

    init(baseURL: URL, client: APIClientProtocol = APIClient()) {
        self.baseURL = baseURL
        self.client = client
    }

    func fetchDefinitions(for word: String) async throws -> [WordDefinition] {
        let escaped = word.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? word
        let url = baseURL.appendingPathComponent(escaped)
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        return try await client.send(req)
    }
}
