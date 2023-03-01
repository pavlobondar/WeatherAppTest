//
//  Location.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import Foundation

struct Location: Codable {
    let city: String
    let country: String
    let localtime: String
    
    enum CodingKeys: String, CodingKey {
        case city = "name"
        case country = "country"
        case localtime = "localtime"
    }
}
