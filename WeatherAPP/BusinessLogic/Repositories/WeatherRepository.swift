//
//  WeatherRepository.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import Foundation

typealias WeatherRepositoryFetchHandler = (Weather) -> ()

protocol WeatherRepository {
    func fetchWeatherIfNeeded(search: String?, completionHandler: @escaping WeatherRepositoryFetchHandler)
    func fetchWeather(search: String?, completionHandler: @escaping WeatherRepositoryFetchHandler)
}

final class WeatherRepositoryImpl: WeatherRepository {
    
    private let storage: Storage
    private let dataLoader: DataLoader
    private let decoder: JSONDecoder
    
    init(storage: Storage,
         dataLoader: DataLoader,
         decoder: JSONDecoder) {
        
        self.storage = storage
        self.dataLoader = dataLoader
        self.decoder = decoder
    }
    
    func fetchWeatherIfNeeded(search: String?, completionHandler: @escaping WeatherRepositoryFetchHandler) {
        if let weather = storage.retrieveObject(by: Weather.self) {
            completionHandler(weather)
        } else {
            fetchWeather(search: search, completionHandler: completionHandler)
        }
    }
    
    func fetchWeather(search: String?, completionHandler: @escaping WeatherRepositoryFetchHandler) {
        let endpoint = Endpoint.weather(matching: search)
        dataLoader.request(endpoint) { [weak storage, weak decoder] result in
            guard let storage = storage, let decoder = decoder else {
                return
            }
            
            switch result {
            case .failure:
                guard let weather = storage.retrieveObject(by: Weather.self) else {
                    return
                }
                completionHandler(weather)
            case .success(let data):
                guard let weather = try? decoder.decode(Weather.self, from: data) else {
                    return
                }
                storage.cache(weather)
                completionHandler(weather)
            } 
        }
    }
}

extension WeatherRepositoryImpl {
    static func makeDefault() -> WeatherRepositoryImpl {
        let storage = StorageImpl(
            userDefaults: UserDefaults.standard
        )
        let loader = DataLoaderImp(
            session: URLSession.shared,
            validator: StatusCodeValidator()
        )
        let decoder = JSONDecoder()
        return WeatherRepositoryImpl(storage: storage, dataLoader: loader, decoder: decoder)
    }
}
