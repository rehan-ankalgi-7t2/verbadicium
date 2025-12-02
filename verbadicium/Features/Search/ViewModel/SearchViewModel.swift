//
//  SearchViewModel.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//


import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var results: [WordDefinition] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let repository: SearchRepository
    private var task: Task<Void, Never>?

    private let initialWord = "magic"     // default word

    init(repository: SearchRepository) {
        self.repository = repository
        loadInitialWord()
    }

    /// Load default word on startup
    private func loadInitialWord() {
        query = initialWord
        search()
    }

    func search() {
        let q = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else { return }

        isLoading = true
        errorMessage = nil
        task?.cancel()

        task = Task {
            do {
                let defs = try await repository.search(word: q)
                await MainActor.run {
                    self.results = defs
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
}
