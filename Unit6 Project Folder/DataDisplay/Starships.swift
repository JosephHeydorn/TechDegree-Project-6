//
//  StarshipData.swift
//  Unit6 Project Folder
//
//  Created by Joseph Heydorn on 11/11/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

struct StarshipResultsData: Decodable {
    let results: [Starship]
}

//Let's make this more "Swifty"
struct Starship: Codable {
    let name: String
    let costInCredits: String
    let length: String
    let starshipClass: String
    let crew: String
}
