//
//  WeatherAPI.swift
//  DublinWeather
//
//  Created by Daniel Colnaghi on 07/02/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//
//  How to change the API Key, https://openweathermap.org
//

import Foundation

//Singleton Design Pattern
class OpenWeatherMapAPI {
    static let shared = OpenWeatherMapAPI()

    //API main parameters
    private let apikey = "afb612b109ee953286b412661f2e6049"
    private let cityid = "2964574" //Dublin City
    private let forecastURL = "https://api.openweathermap.org/data/2.5/forecast"
    
    //Typealias for request parameters
    typealias ForecastResponse = (_ forecast: ForecastAPIResponse) -> Void
    typealias FailResponse = (_ errorMessage: String) -> Void
    
    private init() { }
    
    func fetchForecast(success: @escaping ForecastResponse, fail: @escaping FailResponse ) {
        let url = URL(string: "\(forecastURL)?id=\(cityid)&appid=\(apikey)&units=metric")
        LogHandler.log("🔗 URL \(url?.absoluteString ?? "")")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                LogHandler.error("Error getting data: \(error.debugDescription)")
                fail("Ops, something went wrong.")
                return
            }
            
            do {
                let response = try JSONDecoder().decode(ForecastAPIResponse.self, from: data)
                if response.cod != "200" {
                    LogHandler.error("API error code: \(response.cod)")
                    fail("Ops, something went wrong.")
                } else {
                    LogHandler.log("🔎 Response from API: \(response)")
                    success(response)
                }
                
            } catch {
                LogHandler.error("Error decoding JSON: \(error.localizedDescription)")
                fail("Ops, something went wrong.")
            }
        }.resume()
    }
}
