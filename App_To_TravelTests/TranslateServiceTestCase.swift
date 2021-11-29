//
//  TranslateServiceTestCase.swift
//  App_To_TravelTests
//
//  Created by Léa Kieffer on 10/11/2021.
//

import XCTest
@testable import App_To_Travel

class TranslateServiceTestCase: XCTestCase {

    func testGetTranslateShouldPostFailedCallbackIfError() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctTranslateData, response: FakeResponseData.responseKO, error: nil)
        let translateService = TranslateService(translateSession: session)
        // When
        let expectation = XCTestExpectation(description: "Waiting for queue change")
        translateService.getTranslation { (succes, stringToDecode) in
            // Then
            XCTAssertFalse(succes)
            XCTAssertEqual("", stringToDecode)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetTranslateShouldPostFailedCallbackIfNoData() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctTranslateData, response: FakeResponseData.responseKO, error: nil)
        let translateService = TranslateService(translateSession: session)
        // When
        let expectation = XCTestExpectation(description: "Waiting for queue change")
        translateService.getTranslation { (success, stringToDecode) in
            // Then
            XCTAssertFalse(success)
            XCTAssertEqual("", stringToDecode)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetTranslateShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctTranslateData, response: FakeResponseData.responseKO, error: nil)
        let translateService = TranslateService(translateSession: session)
        // When
        let expectation = XCTestExpectation(description: "Waiting for queue change")
        translateService.getTranslation { (success, stringToDecode) in
            // Then
            XCTAssertFalse(success)
            XCTAssertEqual("", stringToDecode)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetTranslateShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctTranslateData, response: FakeResponseData.responseKO, error: nil)
        let translateService = TranslateService(translateSession: session)
        // When
        let expectation = XCTestExpectation(description: "Waiting for queue change")
        translateService.getTranslation { (success, stringToDecode) in
            // Then
            XCTAssertFalse(success)
            XCTAssertEqual("", stringToDecode)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetTranslateShouldPostSuccessCallbackIfCorrectDataAndNoError() {
        // Given
        let session = FakeURLSession(data: FakeResponseData.correctTranslateData, response: FakeResponseData.responseOK, error: nil)
        let translateService = TranslateService(translateSession: session)
        // When
        let expectation = XCTestExpectation(description: "Waiting for queue change")
        translateService.getTranslation { (success, stringToDecode) in
            // Then
            XCTAssertTrue(success)
            XCTAssertNotNil(stringToDecode)

            let string = "I&#39;m testing a translation"
            XCTAssertEqual(string, stringToDecode)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)
    }
}

