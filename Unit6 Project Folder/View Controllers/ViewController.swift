//
//  ViewController.swift
//  Unit6 Project Folder
//
//  Created by Joseph Heydorn on 10/14/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet private weak var characterButton: UIButton!
    @IBOutlet private weak var vehicleButton: UIButton!
    @IBOutlet private weak var starshipsButton: UIButton!

    //MARK: - IBSegueActions
    //Segue actions are an addition in iOS 13. Just wanted to show you how you can leverage them for the future. Also no stringly typed code to trigger a segue 🎉
    @IBSegueAction private func peopleSegueTriggered(_ coder: NSCoder) -> ViewControllerMainScreen? {
        let viewController = ViewControllerMainScreen(coder: coder)
        viewController?.entity = .people
        
        return viewController
    }
    
    @IBSegueAction private func vehiclesSegueTriggered(_ coder: NSCoder) -> ViewControllerMainScreen? {
        let viewController = ViewControllerMainScreen(coder: coder)
        viewController?.entity = .vehicles
        
        return viewController
    }
    
    @IBSegueAction private func starshipsSegueTriggered(_ coder: NSCoder) -> ViewControllerMainScreen? {
        let viewController = ViewControllerMainScreen(coder: coder)
        viewController?.entity = .starships
        
        return viewController
    }
}
