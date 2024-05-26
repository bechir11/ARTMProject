//
//  NetworkingManagerTests.swift
//  ARTMProjectTests
//
//  Created by Bechir Belkahla on 24/5/2024.
//

import XCTest
@testable import ARTMProject

final class NetworkingManagerTests: XCTestCase {
    
    private var session: URLSession!
    private var url: URL!
    var apiService: APIService!

    override func setUp() {
        url = URL(string: "https://restcountries.com/v3.1/all")
        
        //Configure URLSession to Use the Mock Protocol
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLSessionProtocol.self]
        session = URLSession(configuration: configuration)
        apiService = APIService(session: session)
    }
    
    override func tearDown() {
        super.tearDown()
        session = nil
        apiService = nil
        url = nil
    }
    
    func testFetchData() async throws {
        guard let path = Bundle.main.path(forResource: "CountriesStaticData", ofType: "json"), let data = FileManager.default.contents(atPath: path) else {
            XCTFail("Failed to get static country file")
            return
        }
        
        MockURLSessionProtocol.loadingHandler = {
            // Mock URL response
            let response = HTTPURLResponse(url: self.url,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)
            return (response!, data)
        }
        
        //Injecting the Mock Session into the API Service
        let result = try await apiService.fetchData(url: APIRequest.allCountries, type: Country.self)
        XCTAssertNotNil(result, "The result should not be nil")
        
        //decoding the static json into an object
        let decoder = JSONDecoder()
        let staticJson = try decoder.decode([Country].self, from: data)
        
        //Making test using assert equal
        XCTAssertEqual(result, staticJson, "The returned response should be decoded properly")
        
    }

}
