//
//  Weather.swift
//  App_To_Travel
//
//  Created by Léa Kieffer on 27/10/2021.
//

import Foundation
// swiftlint:disable identifier_name
// Struct for matching Json response
struct Weather: Codable {
    let weather: [WeatherElement]
    let main: Main
    let id: Int
}

struct Main: Codable {
    let temp: Double
}

struct WeatherElement: Codable {
    let description, main: String
}
