//
//  Storage.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import Foundation

protocol Storage: AnyObject {
    func cache(_ object: Codable)
    func retrieveObject<T: Codable>(by type: T.Type) -> T?
}

final class StorageImpl: Storage {
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    // Store objects to data base
    func cache(_ object: Codable) {
        do {
            try userDefaults.setObject(object)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // Fetch data from data base
    func retrieveObject<T>(by type: T.Type) -> T? where T : Codable {
        do {
            return try userDefaults.getObject(castTo: type)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
