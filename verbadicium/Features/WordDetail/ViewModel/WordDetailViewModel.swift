//
//  WordDetailViewModel.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//


import Foundation

final class WordDetailViewModel: ObservableObject {
    @Published var wordDefinition: WordDefinition

    init(wordDefinition: WordDefinition) {
        self.wordDefinition = wordDefinition
    }
}
