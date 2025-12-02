//
//  SettingsViewModel.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//

import Foundation
import Combine

final class SettingsViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var results: [WordDefinition] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let repository: SettingsRepository

    init(repository: SettingsRepository) {
        self.repository = repository
    }
}
