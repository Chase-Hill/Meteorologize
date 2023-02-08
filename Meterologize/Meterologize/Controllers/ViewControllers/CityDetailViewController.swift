//
//  CityDetailViewController.swift
//  Meterologize
//
//  Created by Maxwell Poffenbarger on 2/6/23.
//

import UIKit

class CityDetailViewController: UIViewController {

	// MARK: - Outlets
    
    @IBOutlet weak var CityNameTextField: UITextField!
    
    
    @IBOutlet weak var CityTempTextField: UITextField!
    
    @IBOutlet weak var currentStatusLabel: UILabel!
    
	@IBOutlet weak var projectedHighLabel: UILabel!
	@IBOutlet weak var projectedLowLabel: UILabel!

    // MARK: - Properties
    var objectToRecieveTheDataFromOurPrepareForSegue: City?
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let city = objectToRecieveTheDataFromOurPrepareForSegue,
              let newName = CityNameTextField.text,
              let newTemp = CityTempTextField.text else {return}
        CityController.sharedInstance.updateCity(cityToUpdate: city, newName: newName, newTemp: Double(newTemp) ?? 0.0)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    
	// MARK: - Methods
	func updateViews() {
        guard let city = objectToRecieveTheDataFromOurPrepareForSegue else {return}

		CityNameTextField.text = city.name
		currentStatusLabel.text = city.currentStatus
		CityTempTextField.text = "\(city.currentTemp)"
		projectedHighLabel.text = "\(city.dailyHigh)"
		projectedLowLabel.text = "\(city.dailyLow)"

		self.view.backgroundColor = city.currentTemp <= 80.0 ? .blue : .red
	}
}// end of class
