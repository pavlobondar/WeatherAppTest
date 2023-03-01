//
//  WeatherDay.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import Foundation

struct WeatherDay: Codable {
    let maxtempC: Float
    let mintempC: Float
    let condition: Condition
    
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case condition = "condition"
    }
}
