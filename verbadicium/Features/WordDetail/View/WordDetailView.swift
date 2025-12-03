//
//  WordDetailView.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//


import SwiftUI
import AVFoundation


struct WordDetailView: View {
    @ObservedObject var viewModel: WordDetailViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(viewModel.wordDefinition.word.capitalized)
                            .font(.largeTitle)
                            .bold()
                        
                        Text(viewModel.wordDefinition.phonetic)
                            .font(.caption)
                            .foregroundColor(.purple)
                    }
                    
                    Spacer()
                    
                    if let audioURL = viewModel.wordDefinition.phonetics?.first?.audio, let url = URL(string: audioURL) {
                        AudioPlayerButton(url: url)
                    }
                }
                
                Divider()

                if let meanings = viewModel.wordDefinition.meanings {
                    ForEach(meanings.indices, id: \.self) { idx in
                        let meaning = meanings[idx]
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(meaning.partOfSpeech?.capitalized ?? "")
                                    .font(.headline)
                                VStack {
                                    Divider()
                                }
                            }
                            
                            ForEach(meaning.definitions.indices, id: \.self) { i in
                                let d = meaning.definitions[i]
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("• \(d.definition)")
                                    if d.example != nil {
                                        Text("Example: \(String(describing: d.example))")
                                            .italic()
                                            .font(.caption)
                                    }
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }

                Spacer()
            }
            .padding()
        }
//        .navigationTitle(viewModel.wordDefinition.word.capitalized)
//        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AudioPlayerButton: View {
    let url: URL

    @State private var player: AVPlayer? = nil
    @State private var isPlaying = false

    var body: some View {
        Button(action: togglePlayback) {
            Image(systemName: isPlaying ? "pause.fill" : "speaker.wave.2.fill")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 48, height: 48)
                .background(Color.purple)
                .clipShape(Circle())
        }
        .onDisappear {
            player?.pause()
        }
    }

    private func togglePlayback() {
        if player == nil {
            player = AVPlayer(url: url)

            // Observe when playback ends
            NotificationCenter.default.addObserver(
                forName: .AVPlayerItemDidPlayToEndTime,
                object: player?.currentItem,
                queue: .main
            ) { _ in
                isPlaying = false
            }
        }

        if isPlaying {
            player?.pause()
        } else {
            player?.play()
        }

        isPlaying.toggle()
    }
}
