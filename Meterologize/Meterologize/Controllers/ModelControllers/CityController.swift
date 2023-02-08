//
//  CityController.swift
//  Meterologize
//
//  Created by Maxwell Poffenbarger on 2/6/23.
//

import Foundation

class CityController {
    
    // MARK: - Properties
    // Shared Instance
    static let sharedInstance = CityController()
    // Source of Truth
    var cities: [City] = []
    
    // MARK: - Functions
    func createCity(name: String, temp: Double, high: Int? = nil, low: Int? = nil, status: String? = nil) {
        let newCity = City(name: name, currentTemp: temp, dailyHigh: high, dailyLow: low, currentStatus: status)
        cities.append(newCity)
        
    }
    
    // If I want to update a city object I need the new values for the properties and I need to know what city the user is trying to update.
    func updateCity(cityToUpdate: City, newName: String, newTemp: Double) {
        cityToUpdate.name = newName
        cityToUpdate.currentTemp = newTemp
    }
}
