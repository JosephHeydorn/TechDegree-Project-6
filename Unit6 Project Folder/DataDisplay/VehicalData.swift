//
//  VehicalData.swift
//  Unit6 Project Folder
//
//  Created by Joseph Heydorn on 11/11/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

struct VehicleResultsData: Decodable {
    let results: [VehicleData]
}

struct VehicleData: Codable {
    let name: String
    let cost_in_credits: String
    let length: String
    let vehicle_class: String
    let crew: String
}

//These help balance the arrays inside of the Webmanagers
var arrayOfVehicleAttribute1 = [String]()
var arrayOfVehicleAttribute2 = [String]()
var arrayOfVehicleAttribute3 = [String]()
var arrayOfVehicleAttribute4 = [String]()
var arrayOfVehicleAttribute5 = [String]()

