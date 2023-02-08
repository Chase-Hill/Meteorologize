//
//  CityListTableViewController.swift
//  Meterologize
//
//  Created by Maxwell Poffenbarger on 2/7/23.
//

import UIKit

class CityListTableViewController: UITableViewController {

	// MARK: - Outlets
	@IBOutlet weak var cityNameTextField: UITextField!
	@IBOutlet weak var cityTempTextField: UITextField!

	// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
	// MARK: - Actions
	@IBAction func addCityButtonTapped(_ sender: Any) {
		guard let cityName = cityNameTextField.text, !cityName.isEmpty,
			  let cityTemp = cityTempTextField.text, !cityTemp.isEmpty else { return }

		CityController.sharedInstance.createCity(name: cityName, temp: Double(cityTemp) ?? 0)
		updateTableView()
	}

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return CityController.sharedInstance.cities.count
	}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
		cell.selectionStyle = .none

		let cityForIndex = CityController.sharedInstance.cities[indexPath.row]

		// Will be deprecated at a future date
//		cell.textLabel?.text = cityForIndex.name
//		cell.detailTextLabel?.text = "\(cityForIndex.currentTemp)"

		var config = cell.defaultContentConfiguration()
		config.text = cityForIndex.name
		config.secondaryText = "\(cityForIndex.currentTemp)"
		cell.contentConfiguration = config

        return cell
    }

	// MARK: - Helper
	func updateTableView() {
		self.tableView.reloadData()
	}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // IIDOO
        //What segue has been triggered?
        if segue.identifier == "toDetailViewControllerr" {
            // What cell did the user tap on?
            if let indexPath = tableView.indexPathForSelectedRow {
                // Where is the user going? The 'as?' is type casting.
                if let destination = segue.destination as? CityDetailViewController {
                    // What object am I sending to the detail VC?
                    let city = CityController.sharedInstance.cities[indexPath.row]
                    // Who is going to receive the data?
                    destination.objectToRecieveTheDataFromOurPrepareForSegue = city
                }
            }
        }
    }
} // end of class
