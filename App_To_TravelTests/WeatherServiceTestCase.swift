//
//  WeatherServiceTestCase.swift
//  App_To_TravelTests
//
//  Created by Léa Kieffer on 10/11/2021.
//

import XCTest
@testable import App_To_Travel


class WeatherServiceTestCase: XCTestCase {

    func testGetWeatherShouldPostFailedCallbackIfError() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctWeatherData, response: FakeResponseData.responseKO, error: nil)
        let weatherService = WeatherService(weatherSession: session, weatherNYSession: session)
        // When
        let expectation = XCTestExpectation(description: "Waiting for queue change")
        weatherService.getWeather { (success, weatherDetails) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(weatherDetails)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetWeatherShouldPostFailedCallbackIfNoData() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctWeatherData, response: FakeResponseData.responseKO, error: nil)
        let weatherService = WeatherService(weatherSession: session, weatherNYSession: session)
        // When
        let expectation = XCTestExpectation(description: "Waiting for queue change")
        weatherService.getWeather { (success, weatherDetails) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(weatherDetails)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetWeatherShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctWeatherData, response: FakeResponseData.responseKO, error: nil)
        let weatherService = WeatherService(weatherSession: session, weatherNYSession: session)
        // When
        let expectation = XCTestExpectation(description: "Waiting for queue change")
        weatherService.getWeather { (success, weatherDetails) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(weatherDetails)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetWeatherShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctWeatherData, response: FakeResponseData.responseKO, error: nil)
        let weatherService = WeatherService(weatherSession: session, weatherNYSession: session)
        // When
        let expectation = XCTestExpectation(description: "Waiting for queue change")
        weatherService.getWeather { (success, weatherDetails) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(weatherDetails)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetWeatherShouldPostFailedCallbackIfNYWeatherError() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctWeatherData, response: FakeResponseData.responseKO, error: nil)
        let weatherService = WeatherService(weatherSession: session, weatherNYSession: session)
        // When
        let expectation = XCTestExpectation(description: "Waiting for queue change")
        weatherService.getWeather { (success, weatherDetails) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(weatherDetails)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetWeatherShouldPostFailedCallbackIfNoNYWeatherData() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctWeatherData, response: FakeResponseData.responseKO, error: nil)
        let weatherService = WeatherService(weatherSession: session, weatherNYSession: session)
        // When
        let expectation = XCTestExpectation(description: "Waiting for queue change")
        weatherService.getWeather { (success, weatherDetails) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(weatherDetails)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetWeatherShouldPostFailedCallbackIfIncorrectNYWeatherData() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctWeatherData, response: FakeResponseData.responseKO, error: nil)
        let weatherService = WeatherService(weatherSession: session, weatherNYSession: session)
        // When
        let expectation = XCTestExpectation(description: "Waiting for queue change")
        weatherService.getWeather { (success, weatherDetails) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(weatherDetails)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetWeatherShouldPostFailedCallbackIfNYWeatherIncorrectResponse() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctWeatherData, response: FakeResponseData.responseKO, error: nil)
        let weatherService = WeatherService(weatherSession: session, weatherNYSession: session)
        // When
        let expectation = XCTestExpectation(description: "Waiting for queue change")
        weatherService.getWeather { (success, weatherDetails) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(weatherDetails)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetWeatherShouldPostSuccessCallbackIfWeatherAndNYWeatherAreOK() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctWeatherData, response: FakeResponseData.responseKO, error: nil)
        let weatherService = WeatherService(weatherSession: session, weatherNYSession: session)
        // When
        let expectation = XCTestExpectation(description: "Waiting for queue change")
        weatherService.getWeather { (success, weatherDetails) in
            // Then
            XCTAssertTrue(success)
            XCTAssertNotNil(weatherDetails)

            let parisID = weatherDetails!["selectedCity"]!.id
            let newYorkID = weatherDetails!["newYork"]!.id

            XCTAssertEqual(parisID, 2968815)
            XCTAssertEqual(newYorkID, 5128638)

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }
}

