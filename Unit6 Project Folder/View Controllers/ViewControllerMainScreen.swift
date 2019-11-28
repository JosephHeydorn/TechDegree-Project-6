//
//  ViewControllerMainScreen.swift
//  Unit6 Project Folder
//
//  Created by Joseph Heydorn on 10/31/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import UIKit

final class ViewControllerMainScreen: UIViewController {
    
    var conversionRate = 0
    
    //MARK: - IBOutlets
    //Picker View
    @IBOutlet private weak var pickerView: UIPickerView!
    
    //Upper Labels
    @IBOutlet private weak var mainNameLabel: UILabel!
    @IBOutlet private weak var subNameLabel: UILabel!
    
    //Stack First Row Label
    @IBOutlet private weak var stackFirstLabel: UILabel!
    @IBOutlet private weak var stackSecondLabel: UILabel!
    @IBOutlet private weak var stackThirdLabel: UILabel!
    @IBOutlet private weak var stackFourthLabel: UILabel!
    @IBOutlet private weak var stackFifthLabel: UILabel!
    
    //Stack Second Row Label
    @IBOutlet private weak var middleFirstLabel: UILabel!
    @IBOutlet private weak var middleSecondLabel: UILabel!
    @IBOutlet private weak var middleThirdLabel: UILabel!
    @IBOutlet private weak var middleFourthLabel: UILabel!
    @IBOutlet private weak var middleFifthLabel: UILabel!
    
    //Stack Buttons
    @IBOutlet private weak var metricButton: UIButton!
    @IBOutlet private weak var englishButton: UIButton!
    @IBOutlet private weak var creditsButton: UIButton!
    @IBOutlet private weak var usdButton: UIButton!
    
    //MARK: - Properties
    //This one is used to pass the selected entity from the ViewController.
    var entity: StarWarsEntity?
    
    //Those store the currently selected entities data
    private var people: [Character]?
    private var selectedPerson: Character?
    
    private var starships: [Starship]?
    private var selectedStarship: Starship?
    
    private var vehicles: [Vehicle]?
    private var selectedVehicle: Vehicle?
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
        downloadDataForSelectedEntity()
    }
    
    //MARK: - Data downloading
    //Add Data to transfer
    private func downloadDataForSelectedEntity() {
        guard let entity = entity else { return }
        
        switch entity {
        case .people:
            //Always use a weak or unowned reference to a closure in your VC. Refusing to do so will lead to crashes when the VC is downloading data and you navigate to another VC.
            WebManager.downloadPeople { [weak self] result in
                switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.presentAlert(with: "Error", message: error.localizedDescription)
                    }
                case .success(let people):
                    self?.people = people
                    DispatchQueue.main.async {
                        self?.updateLabels(for: .people)
                        self?.pickerView.reloadAllComponents()
                        self?.pickerView.selectRow(0, inComponent: 0, animated: false)
                        self?.update(with: people[0])
                    }
                }
            }
        case .starships:
            WebManager.downloadStarships { [weak self] result in
                switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.presentAlert(with: "Error", message: error.localizedDescription)
                    }
                case .success(let starships):
                    self?.starships = starships
                    DispatchQueue.main.async {
                        self?.updateLabels(for: .starships)
                        self?.pickerView.reloadAllComponents()
                        self?.pickerView.selectRow(0, inComponent: 0, animated: false)
                        self?.update(with: starships[0])
                    }
                }
            }
        case .vehicles:
            WebManager.downloadVehicles { [weak self] result in
                switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.presentAlert(with: "Error", message: error.localizedDescription)
                    }
                case .success(let vehicles):
                    self?.vehicles = vehicles
                    DispatchQueue.main.async {
                        self?.updateLabels(for: .vehicles)
                        self?.pickerView.reloadAllComponents()
                        self?.pickerView.selectRow(0, inComponent: 0, animated: false)
                        self?.update(with: vehicles[0])
                    }
                }
            }
        }
    }
    
    //MARK: - UI update methods
    //Helper methods to update the UI when an entity is selected
    private func update(with person: Character) {
        middleSecondLabel.text = "Loading"
        
        selectedPerson = person
        
        subNameLabel.text = person.name
        middleFirstLabel.text = person.name
        middleThirdLabel.text = person.height
        middleFourthLabel.text = person.eyeColor
        middleFifthLabel.text = person.hairColor
        
        WebManager.downloadHomePlanet(for: person) { [weak self] result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.presentAlert(with: "Error", message: error.localizedDescription)
                }
            case .success(let planet):
                print(planet)
                DispatchQueue.main.async {
                    self?.middleSecondLabel.text = planet.name
                }
            }
        }
    }
    
    private func update(with starship: Starship) {
        selectedStarship = starship
        
        subNameLabel.text = starship.name
        middleFirstLabel.text = starship.name
        middleSecondLabel.text = starship.costInCredits
        middleThirdLabel.text = starship.length
        middleFourthLabel.text = starship.starshipClass
        middleFifthLabel.text = starship.crew
    }
    
    private func update(with vehicle: Vehicle) {
        selectedVehicle = vehicle
        
        subNameLabel.text = vehicle.name
        middleFirstLabel.text = vehicle.name
        middleSecondLabel.text = vehicle.costInCredits
        middleThirdLabel.text = vehicle.length
        middleFourthLabel.text = vehicle.vehicleClass
        middleFifthLabel.text = vehicle.crew
    }
    
    private func updateLabels(for entity: StarWarsEntity) {
        switch entity {
        case .people:
            stackFirstLabel.text = "Name"
            stackSecondLabel.text = "Home"
            stackThirdLabel.text = "Height"
            stackFourthLabel.text = "Eyes"
            stackFifthLabel.text = "Hair"
            mainNameLabel.text = "Characters"
            creditsButton.isHidden = true
            usdButton.isHidden = true
        case .vehicles:
            stackFirstLabel.text = "Make"
            stackSecondLabel.text = "Cost"
            stackThirdLabel.text = "Length"
            stackFourthLabel.text = "Class"
            stackFifthLabel.text = "Crew"
            mainNameLabel.text = "Vehicals"
            creditsButton.isHidden = false
            usdButton.isHidden = false
        case .starships:
            stackFirstLabel.text = "Make"
            stackSecondLabel.text = "Cost"
            stackThirdLabel.text = "Length"
            stackFourthLabel.text = "Class"
            stackFifthLabel.text = "Crew"
            mainNameLabel.text = "Starships"
            creditsButton.isHidden = false
            usdButton.isHidden = false
        }
    }
    
    //Below Greys out the buttons when it is selected to stop it from being spammed.
    private func enableMetricButton() {
        metricButton.isEnabled = true
        metricButton.setTitleColor(UIColor.gray, for: .disabled)
        englishButton.isEnabled = false
        englishButton.setTitleColor(UIColor.gray, for: .disabled)
    }
    private func enableEnglishButton() {
        metricButton.isEnabled = false
        metricButton.setTitleColor(UIColor.gray, for: .disabled)
        englishButton.isEnabled = true
        englishButton.setTitleColor(UIColor.gray, for: .disabled)
    }
    
    //MARK: - IBActions
    //Conversion Buttons
    @IBAction private func metricButtonPressed(_ sender: Any) {
        guard let entity = entity else { return }
        
        switch entity {
        case .people:
            guard let person = selectedPerson else { return }
            middleThirdLabel.text = person.height
        case .starships:
            guard let starship = selectedStarship else { return }
            middleThirdLabel.text = starship.length
        case .vehicles:
            guard let vehicle = selectedVehicle else { return }
            middleThirdLabel.text = vehicle.length
        }
        
        enableEnglishButton()
    }
    
    @IBAction private func englishButtonPressed(_ sender: Any) {
        guard let entity = entity else { return }
        
        switch entity {
        case .people:
            guard let person = selectedPerson, let heightDouble = Double(person.height) else { return }
            middleThirdLabel.text = heightDouble.convertingCMToInches()
        case .starships:
            guard let starship = selectedStarship, let lengthDouble = Double(starship.length) else { return }
            middleThirdLabel.text = lengthDouble.convertingMetersToInches()
        case .vehicles:
            guard let vehicle = selectedVehicle, let lengthDouble = Double(vehicle.length) else { return }
            middleThirdLabel.text = lengthDouble.convertingMetersToInches()
        }
        
        enableMetricButton()
    }
    
    @IBAction private func usdButtonPressed(_ sender: Any) {
        guard let entity = entity else { return }
        
        switch entity {
        case .people:
            guard let person = selectedPerson else { return }
            middleSecondLabel.text = person.homeworld
        
        case .starships:
            guard let starship = selectedStarship, let creditsDouble = Double(starship.costInCredits) else {
                return }
            if conversionRate == 0 {
            let alert = UIAlertController(title: "Test", message: "Test", preferredStyle: .alert)
                
                alert.addTextField { (textField) in
                    textField.placeholder = "Ex. 250"
                }
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {[weak alert] (_) in
                    let textField = alert?.textFields![0]
                    
                    guard let conversionString: String = textField?.text else {
                        print("Error")
                        return
                    }
                    guard let conversionInt: Int = Int(conversionString) else {
                        print("Error")
                        return
                    }
                    
                    self.conversionRate = conversionInt
                    self.usdButtonPressed(self.usdButton!)
                    
                }))
                self.present(alert, animated: true, completion: nil)
            }
        case .vehicles:
            guard let vehical = selectedVehicle, let creditsDouble = Double(vehical.costInCredits) else { return }
        }
    }
    
    @IBAction private func creditsButtonPressed(_ sender: Any) {
        guard let entity = entity else { return }
        
        switch entity {
        case .people:
            guard let person = selectedPerson else { return }
            middleSecondLabel.text = person.homeworld
        case .starships:
            guard let starship = selectedStarship else { return }
            middleSecondLabel.text = starship.costInCredits
        case .vehicles:
            guard let vehicle = selectedVehicle else { return }
            middleSecondLabel.text = vehicle.costInCredits
        }
        
    }
    
    
    
    
    //Back Button Tap
    @IBAction private func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

//Best practice is to add protocol conformances to extensions. This lets you find your code easier and somewhat encapsulates dependencies
//MARK: - UIPickerViewDataSource
extension ViewControllerMainScreen: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let entity = entity else { return 0 }
        
        switch entity {
        case .people: return people?.count ?? 0
        case .starships: return starships?.count ?? 0
        case .vehicles: return vehicles?.count ?? 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let entity = entity else { return nil }
        
        switch entity {
        case .people:
            guard let people = people else { return nil }
            let personName = people[row].name
            return personName
        case .starships:
            guard let starships = starships else { return nil }
            let starshipName = starships[row].name
            return starshipName
        case .vehicles:
            guard let vehicles = vehicles else { return nil }
            let vehicleName = vehicles[row].name
            return vehicleName
        }
    }
}

//MARK: - UIPickerViewDelegate
extension ViewControllerMainScreen: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let entity = entity else { return }
        
        switch entity {
        case .people:
            guard let people = people else { return }
            update(with: people[row])
        case .starships:
            guard let starships = starships else { return }
            update(with: starships[row])
        case .vehicles:
            guard let vehicles = vehicles else { return }
            update(with: vehicles[row])
        }
    }
}
