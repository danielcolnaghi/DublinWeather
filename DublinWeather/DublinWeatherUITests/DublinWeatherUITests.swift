//
//  DublinWeatherUITests.swift
//  DublinWeatherUITests
//
//  Created by Daniel Colnaghi on 07/02/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

import XCTest

class DublinWeatherUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {

    }

    func testExample() {
        let app = XCUIApplication()
        let backButton = app.navigationBars["DublinWeather.DublinForecastView"].buttons["Back"]
        app.buttons["Dublin Forecast"].tap()
        backButton.tap()
    }

}
