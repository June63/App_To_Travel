//
//  SittingSerivce.swift
//  App_To_Travel
//
//  Created by Léa Kieffer on 27/10/2021.
//

import Foundation

class SettingService {

    // Key words
    private struct Keys {
        static let currency = "currency"
        static let city = "city"
        static let cityID = "cityID"
    }

    // For chosen currency
    static var currency: String {
        get {
            return UserDefaults.standard.string(forKey: Keys.currency) ?? "EUR"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.currency)
        }
    }

    // For chosen city
    static var city: String {
        get {
            return UserDefaults.standard.string(forKey: Keys.city) ?? "Paris, FR"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.city)
        }
    }

    static var cityID: String {
        get {
            return UserDefaults.standard.string(forKey: Keys.cityID) ?? "6455259"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.cityID)
        }
    }
}

