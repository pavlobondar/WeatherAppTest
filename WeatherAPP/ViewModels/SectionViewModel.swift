//
//  SectionViewModel.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import Foundation

enum HeaderType: String {
   case loction = "LOCATION"
   case forecast = "FORECAST"
}

struct SectionViewModel {
    let type: HeaderType
    let items: [ViewModelProtocol]
}
