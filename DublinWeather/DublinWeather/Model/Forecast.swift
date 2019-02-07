//
//  Weather.swift
//  DublinWeather
//
//  Created by Daniel Colnaghi on 07/02/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

import Foundation

struct MainForecast: Decodable {
    let temp: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Double
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

struct Weather: Decodable {
    let mainDescription: String
    let description: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case mainDescription = "main"
        case description
        case icon
    }
}

struct Forecast: Decodable {
    let timestamp: Int
    let mainForecast: MainForecast
    let weather: [Weather]
    let dateText: String
    
    enum CodingKeys: String, CodingKey {
        case timestamp = "dt"
        case mainForecast = "main"
        case weather
        case dateText = "dt_txt"
    }
}
