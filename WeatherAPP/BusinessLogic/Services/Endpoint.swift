//
//  Endpoint.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import Foundation

//https://api.weatherapi.com/v1/forecast.json?key={API_KEY}&q={NAME_OF_CITY}&days=7&aqi=no&alerts=no
//API_KEY 522db6a157a748e2996212343221502

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

enum EndpointError: Error {
    case invalidURL
    case network(Error?)
    case invalidResponse(URLResponse?)
    case validation(Error)
}

extension Endpoint {
    static func weather(matching query: String?) -> Endpoint {
        var queries: [URLQueryItem] = []
        if let query = query,
           let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) {
            queries.append(.init(name: "key", value: "522db6a157a748e2996212343221502"))
            queries.append(.init(name: "q", value: encodedQuery))
            queries.append(.init(name: "days", value: "7"))
            queries.append(.init(name: "aqi", value: "no"))
            queries.append(.init(name: "alerts", value: "no"))
        }
        
        return Endpoint(
            path: "/v1/forecast.json",
            queryItems: queries
        )
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.weatherapi.com"
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}
