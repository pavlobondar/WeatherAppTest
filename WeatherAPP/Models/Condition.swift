//
//  Condition.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import Foundation

struct Condition: Codable {
    let text: String
    let icon: String
    let code: Int
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case icon = "icon"
        case code = "code"
    }
}
