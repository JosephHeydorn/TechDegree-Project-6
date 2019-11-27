//
//  UIViewController+UIAlertController.swift
//  Unit6 Project Folder
//
//  Created by Dennis Parussini on 27.11.19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import UIKit

//A helper extension on UIViewController to display a standard alert for error handling
extension UIViewController {
    func presentAlert(with title: String?, message: String?, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
