//
//  WordListItemView.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//


import SwiftUI

struct WordListItemView: View {
    let def: WordDefinition

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(def.word.capitalized)
                .font(.headline)
            if let first = def.meanings?.first?.partOfSpeech {
                Text(first)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            if let example = def.meanings?.first?.definitions.first?.example {
                Text(example)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 8)
    }
}
