//
//  DublinForecastViewModel.swift
//  DublinWeather
//
//  Created by Daniel Colnaghi on 07/02/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

import Foundation

class DublinForecastViewModel {
    private var forecastList = [Forecast]()
    
    func loadDublinForecast(_ success:@escaping() -> Void, fail: @escaping(_ errorMessage: String) -> Void) {
        //Verify if the last request expired
        //Load cached request
        //Fetch Dublin forecast
        OpenWeatherMapAPI.shared.fetchForecast(success: { (response) in
            self.forecastList = response.list
            success()
        }) { (errorMessage) in
            LogHandler.error(errorMessage)
            fail("Couldn't connect to the server.")
        }
    }
    
    var count: Int {
        return forecastList.count
    }
    
    func forecast(atIndex index:Int) -> Forecast {
        return forecastList[index]
    }
}
