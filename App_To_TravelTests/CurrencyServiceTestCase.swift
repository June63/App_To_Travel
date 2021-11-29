//
//  CurrencyServiceTestCase.swift
//  App_To_TravelTests
//
//  Created by Léa Kieffer on 10/11/2021.
//

import XCTest
@testable import App_To_Travel

class CurrencyServiceTestCase: XCTestCase {
    
    func testGetCurrencyShouldPostFailedCallbackIfNoData() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctCurrencyData, response: FakeResponseData.responseKO, error: nil)
        let currencyService = CurrencyService(currencySession: session)
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        currencyService.getCurrency { (success) in
            // Then
            XCTAssertFalse(success)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetCurrencyShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctCurrencyData, response: FakeResponseData.responseKO, error: nil)
        let currencyService = CurrencyService(currencySession: session)
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        currencyService.getCurrency { (success) in
            // Then
            XCTAssertFalse(success)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetCurrencyShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctCurrencyData, response: FakeResponseData.responseKO, error: nil)
        let currencyService = CurrencyService(currencySession: session)
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        currencyService.getCurrency { (success) in
            // Then
            XCTAssertFalse(success)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetCurrencyShouldPostSuccesCallbackIfCorrectDataAndNoError() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctCurrencyData, response: FakeResponseData.responseOK, error: nil)
        let currencyService = CurrencyService(currencySession: session)
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        currencyService.getCurrency { (success) in
            // Then
            XCTAssertTrue(success)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }
}
