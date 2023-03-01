//
//  LocationViewModel.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import Foundation

final class LocationViewModel: ViewModelProtocol {
    let location: Location
    
    var city: String {
        "\(location.city), \(location.country)"
    }
    
    var date: String {
        location.localtime
    }
    
    init(location: Location) {
        self.location = location
    }
}
