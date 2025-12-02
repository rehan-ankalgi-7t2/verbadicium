//
//  ServiceContainer.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//

import Foundation
import Combine

final class ServiceContainer: ObservableObject {
    private var singletons: [String: Any] = [:]
    private let env: AppEnvironment

    init(env: AppEnvironment = .default) {
        self.env = env
        registerDefaults()
    }

    private func registerDefaults() {
        register(DictionaryServiceImpl(baseURL: env.apiBaseURL) as DictionaryService)
        register(APIClient() as APIClientProtocol)
        register(SearchRepositoryImpl(service: resolve(DictionaryService.self)) as SearchRepository)
        register(WordDetailRepositoryImpl(service: resolve(DictionaryService.self)) as WordDetailRepository)
        register(SettingsRepositoryImpl() as SettingsRepository)
        register(SearchViewModel(repository: resolve(SearchRepository.self)) as SearchViewModel)
        register(SettingsViewModel(repository: resolve(SettingsRepository.self)) as SettingsViewModel)
    }

    func register<T>(_ instance: T) {
        let key = String(describing: T.self)
        singletons[key] = instance
    }

    func resolve<T>(_ type: T.Type) -> T {
        let key = String(describing: T.self)
        guard let instance = singletons[key] as? T else {
            fatalError("No registration for type \(key)")
        }
        return instance
    }
}
