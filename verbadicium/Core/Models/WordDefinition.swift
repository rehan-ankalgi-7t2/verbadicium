//
//  WordDefinition.swift
//  verbadicium
//
//  Created by Rehan on 02/12/25.
//


import Foundation

// Models matching Free Dictionary API minimal fields

struct WordDefinition: Codable, Identifiable {
    var id: UUID { UUID() }
    let word: String
    let phonetics: [Phonetic]?
    let meanings: [Meaning]?
    let phonetic: String
}

struct Phonetic: Codable {
    let text: String?
    let audio: String?
}

struct Meaning: Codable {
    let partOfSpeech: String?
    let definitions: [Definition]
}

struct Definition: Codable {
    let definition: String
    let example: String?
    let synonyms: [String]?
}
