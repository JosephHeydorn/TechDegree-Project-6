//
//  ViewController.swift
//  Unit6 Project Folder
//
//  Created by Joseph Heydorn on 10/14/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import UIKit

var viewControllerData = ViewControllerDisplayOragnizer.character

class ViewController: UIViewController {

    @IBOutlet weak var characterButton: UIButton!
    @IBOutlet weak var vehicleButton: UIButton!
    @IBOutlet weak var starshipsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadAllData()
        // Do any additional setup after loading the view.
    }

    @IBAction func characterButtonPressed(_ sender: Any) {
        viewControllerData = ViewControllerDisplayOragnizer.character
        pickerViewCharacterDisplay()
        VCTransition()
        
    }
    
    @IBAction func vehicleButtonPressed(_ sender: Any) {
        viewControllerData = ViewControllerDisplayOragnizer.vehical
        pickerViewVehicleDisplay()
        VCTransition()
    }
    
    @IBAction func starshipsButtonPressed(_ sender: Any) {
        viewControllerData = ViewControllerDisplayOragnizer.starships
        pickerViewStarshipDisplay()
        VCTransition()
    }
    
    func VCTransition() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerMainScreen") as! ViewControllerMainScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    //This helps save the user data so they aren't contstantly downloading the data everytime they load a new view.
    func downloadAllData() {
        WebManager.downloaderPeopleAPI()
        WebManager.downloaderVehicleAPI()
        WebManager.downloaderStarshipAPI()
    }

}

