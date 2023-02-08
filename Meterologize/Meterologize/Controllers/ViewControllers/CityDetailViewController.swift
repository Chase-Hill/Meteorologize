//
//  CityDetailViewController.swift
//  Meterologize
//
//  Created by Maxwell Poffenbarger on 2/6/23.
//

import UIKit

class CityDetailViewController: UIViewController {

	// MARK: - Outlets
	@IBOutlet weak var cityNameLabel: UILabel!
	@IBOutlet weak var currentStatusLabel: UILabel!
	@IBOutlet weak var currentTempLabel: UILabel!
	@IBOutlet weak var projectedHighLabel: UILabel!
	@IBOutlet weak var projectedLowLabel: UILabel!

    // MARK: - Properties
    var objectToRecieveTheDataFromOurPrepareForSegue: City?
    
	// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

		updateViews()
    }

	// MARK: - Methods
	func updateViews() {
        guard let city = objectToRecieveTheDataFromOurPrepareForSegue else {return}

		cityNameLabel.text = city.name
		currentStatusLabel.text = city.currentStatus
		currentTempLabel.text = "\(city.currentTemp)"
		projectedHighLabel.text = "\(city.dailyHigh)"
		projectedLowLabel.text = "\(city.dailyLow)"

		self.view.backgroundColor = city.currentTemp <= 80.0 ? .blue : .red
	}
}// end of class
