//
//  City.swift
//  Meterologize
//
//  Created by Maxwell Poffenbarger on 2/6/23.
//

import Foundation

class City {
	var name: String
	var currentTemp: Double
	let dailyHigh: Int?
	let dailyLow: Int?
	let currentStatus: String?

	init(name: String, currentTemp: Double, dailyHigh: Int?, dailyLow: Int?, currentStatus: String?) {
		self.name = name
		self.currentTemp = currentTemp
		self.dailyHigh = dailyHigh
		self.dailyLow = dailyLow
		self.currentStatus = currentStatus
	}
} // end of class
