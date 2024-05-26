//
//  MockURLSessionProtocol.swift
//  ARTMProjectTests
//
//  Created by Bechir Belkahla on 24/5/2024.
//

import Foundation
import XCTest

class MockURLSessionProtocol: URLProtocol {
    
    static var loadingHandler: (() -> (HTTPURLResponse, Data?))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let handler = MockURLSessionProtocol.loadingHandler else {
            XCTFail("Loading handler is not set")
            return
        }
        
        let (response, data) = handler()
        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        if let data = data {
            client?.urlProtocol(self, didLoad: data)
        }
        client?.urlProtocolDidFinishLoading(self)
        
    }
    
    override func stopLoading() {
        
    }
}
