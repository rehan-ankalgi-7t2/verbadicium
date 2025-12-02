//
//  SearchTab.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//

import SwiftUI

struct SearchTab: View {
    @EnvironmentObject var container: ServiceContainer

    var body: some View {
        let vm = container.resolve(SearchViewModel.self)
        NavigationStack {
            SearchView(viewModel: vm)
        }
    }
}
