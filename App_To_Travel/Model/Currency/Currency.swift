//
//  Currency.swift
//  App_To_Travel
//
//  Created by Léa Kieffer on 27/10/2021.
//

import Foundation
import UIKit

// Struct for matching Json response
class Currency: Codable {
    // Singleton pattern
    static var shared = Currency()
    private init() {}

    // Properties
    var base, date: String?
    var rates: [String: Double]?
}


