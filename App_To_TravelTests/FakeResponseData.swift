//
//  FakeResponseData.swift
//  App_To_TravelTests
//
//  Created by Léa Kieffer on 17/11/2021.
//

import Foundation

class FakeResponseData {

    static var correctCurrencyData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Currency", withExtension: "json")!
        return try! Data(contentsOf: url)
    }

    static var correctWeatherData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Weather", withExtension: "json")!
        return try! Data(contentsOf: url)
    }
  
    static var correctWeatherNYData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "WeatherNY", withExtension: "json")!
        return try! Data(contentsOf: url)
    }

    static var correctTranslateData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Translate", withExtension: "json")!
        return try! Data(contentsOf: url)
    }

    static var correctImageData = "ImageData".data(using: .utf8)

    static var incorrectData = "ErrorData".data(using: .utf8)

    static var responseOK = HTTPURLResponse(url: URL(string: "https://google.fr")!, statusCode: 200, httpVersion: nil, headerFields: nil)
    static var responseKO = HTTPURLResponse(url: URL(string: "https://google.fr")!, statusCode: 500, httpVersion: nil, headerFields: nil)

    class FakeEror: Error {}
    static let error = FakeEror()
}
