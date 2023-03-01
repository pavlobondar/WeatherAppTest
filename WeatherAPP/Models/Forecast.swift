//
//  Forecast.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import Foundation

struct Forecast: Codable {
    let forecastDays: [ForecastDay]
    
    enum CodingKeys: String, CodingKey {
        case forecastDays = "forecastday"
    }
}

struct ForecastDay: Codable {
    let date: String
    let day: WeatherDay
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case day = "day"
    }
}
