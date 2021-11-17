//
//  FakeURLSession.swift
//  App_To_TravelTests
//
//  Created by Léa Kieffer on 17/11/2021.
//

import Foundation

class FakeURLSession: URLSession {

    private var data: Data?
    private var response: HTTPURLResponse?
    private var error: Error?

    init(data: Data?, response: HTTPURLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }

    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = FakeURLSessionDataTask()
        task.data = data
        task.responseError = error
        task.urlResponse = response
        task.completionHandler = completionHandler
        return task
    }

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let dataTask = FakeURLSessionDataTask()
        dataTask.data = data
        dataTask.urlResponse = response
        dataTask.responseError = error
        dataTask.completionHandler = completionHandler
        return dataTask
    }

}

class FakeURLSessionDataTask: URLSessionDataTask {
    var data: Data?
    var urlResponse: HTTPURLResponse?
    var responseError: Error?
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?

    override init() {}

    override func resume() {
        completionHandler?(data, urlResponse, responseError)
    }

    override func cancel() {}
}
