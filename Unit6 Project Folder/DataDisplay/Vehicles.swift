//
//  VehicalData.swift
//  Unit6 Project Folder
//
//  Created by Joseph Heydorn on 11/11/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

struct VehicleResultsData: Decodable {
    let results: [Vehicle]
}

//Let's make this more "Swifty"
struct Vehicle: Codable {
    let name: String
    let costInCredits: String
    let length: String
    let vehicleClass: String
    let crew: String
}
