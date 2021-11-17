//
//  URLSessionProtocol.swift
//  App_To_TravelTests
//
//  Created by Léa Kieffer on 17/11/2021.
//

import Foundation

protocol URLSessionDataTaskProtocol {
  func resume()
  func cancel()
}

protocol URLSessionProtocol {
  func dataTask(
    with request: URLRequest,
    completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
  ) -> URLSessionDataTask
}

extension URLSession : URLSessionProtocol{}
extension URLSessionDataTask : URLSessionDataTaskProtocol{}
