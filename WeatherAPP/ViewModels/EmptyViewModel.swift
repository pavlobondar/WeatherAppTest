//
//  EmptyViewModel.swift
//  WeatherAPP
//
//  Created by Pavlo on 01.03.2023.
//

import Foundation

final class EmptyViewModel: ViewModelProtocol {

    var title: String {
        "Data does not exist"
    }
    
    var subtitle: String {
        "Сheck your internet connection"
    }
    
    var image: String {
        "wifi.exclamationmark"
    }
}
