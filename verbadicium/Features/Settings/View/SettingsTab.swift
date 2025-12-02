//
//  SettingsTab.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//

import SwiftUI

struct SettingsTab: View {
    @EnvironmentObject var container: ServiceContainer
    var body: some View {
        let vm = container.resolve(SettingsViewModel.self)
        NavigationStack {
            SettingsView(viewModel: vm)
        }
    }
}
