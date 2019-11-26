//
//  MeterConversion.swift
//  Unit6 Project Folder
//
//  Created by Joseph Heydorn on 11/24/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

var meterPasserDouble = 1.00
var meterPasserString = ""

func convertToMeters() {
    let meter = meterPasserDouble
    let inchConversion = 39.37
    let result = meter * inchConversion
    let roundedNumber = result.rounded()
    meterPasserDouble = roundedNumber
    meterPasserString = String(meterPasserDouble)
}
