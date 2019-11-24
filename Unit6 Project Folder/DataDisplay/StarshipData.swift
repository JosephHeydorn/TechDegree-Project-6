//
//  StarshipData.swift
//  Unit6 Project Folder
//
//  Created by Joseph Heydorn on 11/11/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

struct StarshipResultsData: Decodable {
    let results: [StarshipData]
}

struct StarshipData: Codable {
    let name: String
    let cost_in_credits: String
    let length: String
    let starship_class: String
    let crew: String

}

//These help balance the arrays inside of the Webmanagers
var arrayOfStarshipAttribute1 = [String]()
var arrayOfStarshipAttribute2 = [String]()
var arrayOfStarshipAttribute3 = [String]()
var arrayOfStarshipAttribute4 = [String]()
var arrayOfStarshipAttribute5 = [String]()
