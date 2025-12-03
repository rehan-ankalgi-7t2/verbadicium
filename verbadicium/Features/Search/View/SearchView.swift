//
//  SearchView.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//


import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // MARK: Search Bar
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search a word", text: $viewModel.query, onCommit: {
                            viewModel.search()
                        })
                        .autocorrectionDisabled()
                    }
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .padding(.leading, 6)
                    }
                } // Search Bar
                .padding(.horizontal)
                
                // MARK: Error
                if let err = viewModel.errorMessage {
                    Text(err)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                }
                
                // MARK: Results
                List(viewModel.results) { wordDef in
                    NavigationLink(
                        destination: WordDetailView(
                            viewModel: WordDetailViewModel(wordDefinition: wordDef)
                        )
                    ) {
                        WordListItemView(def: wordDef)
                    }
                }
                .listStyle(.plain)
                
                Spacer()
            }
            .navigationTitle("Verbadicium 🪄")
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel(repository: SearchRepositoryImpl(service: DictionaryServiceImpl(baseURL: AppEnvironment.default.apiBaseURL))))
    }
}
