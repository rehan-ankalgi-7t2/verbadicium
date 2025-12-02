//
//  WordDetailRepository.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//


import Foundation

protocol WordDetailRepository {
    func getDetail(for wordDefinition: WordDefinition) async throws -> WordDefinition
}

final class WordDetailRepositoryImpl: WordDetailRepository {
    private let service: DictionaryService

    init(service: DictionaryService) {
        self.service = service
    }

    func getDetail(for wordDefinition: WordDefinition) async throws -> WordDefinition {
        // For Free Dictionary API the search returns full detail, so return as-is or refetch if needed
        return wordDefinition
    }
}
