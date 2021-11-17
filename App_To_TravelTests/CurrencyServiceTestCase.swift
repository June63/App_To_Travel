//
//  CurrencyServiceTestCase.swift
//  App_To_TravelTests
//
//  Created by Léa Kieffer on 10/11/2021.
//

import XCTest
@testable import App_To_Travel

class CurrencyServiceTestCase: XCTestCase {

    func testGetCurrencyShouldPostFailedCallbackIfError() {
        // Given
        let currencyService = CurrencyService(
            currencySession: MockURLProtocol
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        currencyService.getCurrency { (success) in
            // Then
            XCTAssertFalse(success)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetCurrencyShouldPostFailedCallbackIfNoData() {
        // Given
        let currencyService = CurrencyService(
            currencySession: URLSessionFake(data: nil, response: nil, error: nil))
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
        let currencyService = CurrencyService(
            currencySession: URLSessionFake(
                data: FakeResponseData.currencyCorrectData,
                response: FakeResponseData.reponseKO,
                error: nil))
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
        let currencyService = CurrencyService(
            currencySession: URLSessionFake(
                data: FakeResponseData.incorrectData,
                response: FakeResponseData.reponseOK,
                error: nil))
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
        let currencyService = CurrencyService(
            currencySession: URLSessionFake(
                data: FakeResponseData.currencyCorrectData,
                response: FakeResponseData.reponseOK,
                error: nil))
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
