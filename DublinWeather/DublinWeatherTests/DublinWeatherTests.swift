//
//  DublinWeatherTests.swift
//  DublinWeatherTests
//
//  Created by Daniel Colnaghi on 07/02/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

import XCTest
@testable import DublinWeather

class DublinWeatherTests: XCTestCase {

    var list: [Forecast]!
    var expectation: XCTestExpectation!
    
    override func setUp() {
        list = [Forecast]()
        expectation = XCTestExpectation(description: "Fetch Forecast Data")
    }

    override func tearDown() {
        list = nil
        expectation = nil
    }

    func testExample() {
        OpenWeatherMapAPI.shared.fetchForecast(success: { (response) in
            XCTAssertEqual(response.city.name, "Dublin")
            XCTAssertEqual(response.city.id, 2964574)
            self.expectation.fulfill()
        }) { (errorMessage) in
            XCTFail("Fetch Forecast error: \(errorMessage)")
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }

}
