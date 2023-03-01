//
//  WeatherViewModel.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import Foundation

final class WeatherViewModel: ViewModelProtocol {
    
    private var weatherRepository: WeatherRepository!
    private(set) var sectionData: [SectionViewModel] = [] {
        didSet {
            self.bindWeatherViewModelToController?()
        }
    }

    var bindWeatherViewModelToController: (() -> Void)?
    
    private let city = "London"
    
    init() {
        self.weatherRepository = WeatherRepositoryImpl.makeDefault()
        fetchWeatherData()
    }
    
    func fetchWeatherData() {
        weatherRepository.fetchWeatherIfNeeded(search: city) { [weak self] weather in
            DispatchQueue.main.async {
                self?.handleWeather(weather: weather)
            }
        }
    }
    
    func updateWeatherData() {
        weatherRepository.fetchWeather(search: city) { [weak self] weather in
            DispatchQueue.main.async { [weak self] in
                self?.handleWeather(weather: weather)
            }
        }
    }
    
    func headerType(for indexPath: IndexPath) -> HeaderType? {
        guard sectionData.indices.contains(indexPath.section) else {
            return nil
        }
        return sectionData[indexPath.section].type
    }
    
    func getCellViewModel(for indexPath: IndexPath) -> ViewModelProtocol {
        sectionData[indexPath.section].items[indexPath.row]
    }
    
    private func handleWeather(weather: Weather) {
        sectionData = [
            SectionViewModel(type: .loction, items: [LocationViewModel(location: weather.location)]),
            SectionViewModel(type: .forecast, items: weather.forecast.forecastDays.map({ ForecastViewModel(forecastDay: $0) }))
        ]
    }
}
