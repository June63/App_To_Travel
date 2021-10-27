//
//  City.swift
//  App_To_Travel
//
//  Created by Léa Kieffer on 27/10/2021.
//

import Foundation
// swiftlint:disable identifier_name
// Struct for matching Json response
typealias Cities = [City]

struct City: Codable {
    let id: Int
    let name, country: String
}
