//
//  PostApiTest.swift
//  App_To_TravelTests
//
//  Created by Léa Kieffer on 17/11/2021.
//

@testable import App_To_Travel
import XCTest

class PostAPITest: XCTestCase {
    
  var postDetailAPI: PostDetailAPI!
  var expectation: XCTestExpectation!
  let apiURL = URL
  
  override func setUp() {
    let configuration = URLSessionConfiguration.default
    configuration.protocolClasses = [MockURLProtocol.self]
    let urlSession = URLSession.init(configuration: configuration)
    
    postDetailAPI = PostDetailAPI(urlSession: urlSession)
    expectation = expectation(description: "Expectation")
  }
}
