//
//  WeatherAPPTests.swift
//  WeatherAPPTests
//
//  Created by Pavlo on 01.03.2023.
//

import XCTest
@testable import WeatherAPP

final class WeatherAPPTests: XCTestCase {
    
    var endpoint: Endpoint!

    override func setUpWithError() throws {
        endpoint = Endpoint.weather(matching: "London")
    }

    override func tearDownWithError() throws {
        endpoint = nil
        try super.tearDownWithError()
    }

    func testEndpoint() throws {
        
        let url = endpoint.url?.absoluteString
        let expectedURL = "https://api.weatherapi.com/v1/forecast.json?key=522db6a157a748e2996212343221502&q=London&days=7&aqi=no&alerts=no"
        XCTAssertEqual(url, expectedURL)
    }
}
