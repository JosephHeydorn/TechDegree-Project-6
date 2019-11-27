//
//  ViewControllerMainScreen.swift
//  Unit6 Project Folder
//
//  Created by Joseph Heydorn on 10/31/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import UIKit

class ViewControllerMainScreen: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var values: [AnyObject] = []
    
    let client = WebManager()
    
    //Picker View
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerViewButton: UIButton!
    
    
    
    //Upper Labels
    @IBOutlet weak var mainNameLabel: UILabel!
    @IBOutlet weak var subNameLabel: UILabel!
    
    
    
    //Stack First Row Label
    @IBOutlet weak var stackFirstLabel: UILabel!
    @IBOutlet weak var stackSecondLabel: UILabel!
    @IBOutlet weak var stackThirdLabel: UILabel!
    @IBOutlet weak var stackFourthLabel: UILabel!
    @IBOutlet weak var stackFifthLabel: UILabel!
    
    //Stack Second Row Label
    @IBOutlet weak var middleFirstLabel: UILabel!
    @IBOutlet weak var middleSecondLabel: UILabel!
    @IBOutlet weak var middleThirdLabel: UILabel!
    @IBOutlet weak var middleFourthLabel: UILabel!
    @IBOutlet weak var middleFifthLabel: UILabel!
    
    //Stack Buttons
    @IBOutlet weak var metricButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var creditsButton: UIButton!
    @IBOutlet weak var usdButton: UIButton!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        checkDataDisplay()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    //Add Data to transfer
    func checkDataDisplay() {
        if viewControllerData == ViewControllerDisplayOragnizer.character {
            stackFirstLabel.text = "Name"
            stackSecondLabel.text = "Home"
            stackThirdLabel.text = "Height"
            stackFourthLabel.text = "Eyes"
            stackFifthLabel.text = "Hair"
            mainNameLabel.text = "Characters"
            creditsButton.isHidden = true
            usdButton.isHidden = true
            englishButtonEnabled()
            WebManager.downloaderPeopleAPI()
        } else if viewControllerData == ViewControllerDisplayOragnizer.vehical {
            stackFirstLabel.text = "Make"
            stackSecondLabel.text = "Cost"
            stackThirdLabel.text = "Length"
            stackFourthLabel.text = "Class"
            stackFifthLabel.text = "Crew"
            mainNameLabel.text = "Vehicals"
            creditsButton.isHidden = false
            usdButton.isHidden = false
        } else if viewControllerData == ViewControllerDisplayOragnizer.starships {
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

    
    
    //ALL THINGS PICKER VIEW
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewAttribute1.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewAttribute1[row]
    }
    
    @IBAction func pickerViewButtonPressed(_ sender: Any) {
        updateCurrentView()
    }
    
    //Conversion Buttons
    @IBAction func metricButtonPressed(_ sender: Any) {
        middleThirdLabel.text = displayAttribute3[pickerView.selectedRow(inComponent: 0)]
        englishButtonEnabled()
        
    }
    
    @IBAction func englishButtonPressed(_ sender: Any) {
        unitStringConversion()
        convertToMeters()
        middleThirdLabel.text = meterPasserString
        metricButtonEnabled()
    }
    
    func updateCurrentView() {
        subNameLabel.text = pickerViewAttribute1[pickerView.selectedRow(inComponent: 0)]
        middleFirstLabel.text = pickerViewAttribute1[pickerView.selectedRow(inComponent: 0)]
        middleSecondLabel.text = displayAttribute2[pickerView.selectedRow(inComponent: 0)]
        middleThirdLabel.text = displayAttribute3[pickerView.selectedRow(inComponent: 0)]
        middleFourthLabel.text = displayAttribute4[pickerView.selectedRow(inComponent: 0)]
        middleFifthLabel.text = displayAttribute5[pickerView.selectedRow(inComponent: 0)]
        englishButtonEnabled()
    }

    func unitStringConversion() {
        let metersString = displayAttribute3[pickerView.selectedRow(inComponent: 0)]
        let metersDoubleConvert = Double(metersString) ?? 0
        meterPasserDouble = metersDoubleConvert
    }
    
    //Below Greys out the buttons when it is selected to stop it from being spammed. 
    func metricButtonEnabled() {
        metricButton.isEnabled = true
        metricButton.setTitleColor(UIColor.gray, for: .disabled)
        englishButton.isEnabled = false
        englishButton.setTitleColor(UIColor.gray, for: .disabled)
    }
    func englishButtonEnabled() {
        metricButton.isEnabled = false
        metricButton.setTitleColor(UIColor.gray, for: .disabled)
        englishButton.isEnabled = true
        englishButton.setTitleColor(UIColor.gray, for: .disabled)
    }
}
