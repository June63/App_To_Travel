//
//  Translate.swift
//  App_To_Travel
//
//  Created by Léa Kieffer on 27/10/2021.
//

import Foundation

// Struct model for match api json response
struct TranslateModel: Codable {
    let data: DataClass!
}

struct DataClass: Codable {
    let translations: [Translation]
}

struct Translation: Codable {
    let translatedText, detectedSourceLanguage: String
}

// Translate model
struct Translate {
    static var shared = Translate()
    private init() {}

    var quote = ""
    var translatedQuote = ""
}

