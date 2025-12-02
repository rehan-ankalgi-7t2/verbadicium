//
//  App.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//

import SwiftUI

@main struct Verbadicium: App {
    @StateObject private var container = ServiceContainer()
    
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environmentObject(container)
        }
    }
}
