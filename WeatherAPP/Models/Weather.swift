//
//  Weather.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import Foundation

struct Weather: Codable {
    let location: Location
    let forecast: Forecast
    
    enum CodingKeys: String, CodingKey {
        case location = "location"
        case forecast = "forecast"
    }
}
