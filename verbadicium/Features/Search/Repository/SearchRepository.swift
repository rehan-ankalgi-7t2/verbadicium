//
//  SearchRepository.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//


import Foundation

protocol SearchRepository {
    func search(word: String) async throws -> [WordDefinition]
}

final class SearchRepositoryImpl: SearchRepository {
    private let service: DictionaryService

    init(service: DictionaryService) {
        self.service = service
    }

    func search(word: String) async throws -> [WordDefinition] {
        try await service.fetchDefinitions(for: word)
    }
}
