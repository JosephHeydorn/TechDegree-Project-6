//
//  MeterConversion.swift
//  Unit6 Project Folder
//
//  Created by Joseph Heydorn on 11/24/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

/*
 This is a great opportunity for an extension. With this you can just call the function on the Double itself, for example:
 let lengthInCM = 1.5
 let lengthInInches = lengthInCM.convertingCMToInches
 */
var alertTextFieldPasser = String()

extension Double {
    func convertingMetersToInches() -> String {
        return String(describing: (self * 39.37).rounded())
    }
    
    func convertingCMToInches() -> String {
        return String(describing: (self * 0.3937).rounded())
    }
    
    func convertToUSD() -> String {
        let stringConverter = Double(alertTextFieldPasser)
        return String(describing: (self / stringConverter!).rounded())
    }
}
