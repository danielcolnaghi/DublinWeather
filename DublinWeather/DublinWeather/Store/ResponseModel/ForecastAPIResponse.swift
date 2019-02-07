//
//  ForecastAPIResponse.swift
//  DublinWeather
//
//  Created by Daniel Colnaghi on 07/02/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

import Foundation

struct ForecastAPIResponse: Decodable {
    let cod: String
    let list: [Forecast]
    let city: City
}

struct City: Decodable {
    let id: Int
    let name: String
}
