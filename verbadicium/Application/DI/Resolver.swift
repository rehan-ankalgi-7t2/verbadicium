//
//  Resolver.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//

import Foundation

@propertyWrapper
struct Inject<T> {
    private var container: ServiceContainer { Resolver.shared }
    var wrappedValue: T { container.resolve(T.self) }
}

enum Resolver {
    static var shared = ServiceContainer()
}
