//
//  ForecastViewModel.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import Foundation

final class ForecastViewModel: ViewModelProtocol {
    let forecastDay: ForecastDay
    
    var icon: String {
        "\(forecastDay.day.condition.code)"
    }
    
    var tempC: String {
        "Temperature C: Min: \(forecastDay.day.mintempC), Max: \(forecastDay.day.maxtempC)"
    }
    
    var date: String {
        forecastDay.date
    }
    
    init(forecastDay: ForecastDay) {
        self.forecastDay = forecastDay
    }
}
