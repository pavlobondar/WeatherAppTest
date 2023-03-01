//
//  ObjectSavable.swift
//  WeatherAPP
//
//  Created by Pavlo on 01.03.2023.
//

import Foundation

protocol ObjectSavable {
    func setObject<Object>(_ object: Object) throws where Object: Encodable
    func getObject<Object>(castTo type: Object.Type) throws -> Object where Object: Decodable
}

enum ObjectSavableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"
    
    var errorDescription: String? {
        rawValue
    }
}

extension UserDefaults: ObjectSavable {
    
    func setObject<Object>(_ object: Object) throws where Object: Encodable {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(object)
                set(data, forKey: String(describing: Object.self))
            } catch {
                throw ObjectSavableError.unableToEncode
            }
        }
        
        func getObject<Object>(castTo type: Object.Type) throws -> Object where Object: Decodable {
            guard let data = data(forKey: String(describing: Object.self)) else { throw ObjectSavableError.noValue }
            let decoder = JSONDecoder()
            do {
                let object = try decoder.decode(type, from: data)
                return object
            } catch {
                throw ObjectSavableError.unableToDecode
            }
        }
}
