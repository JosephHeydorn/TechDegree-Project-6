//
//  CharacterData.swift
//  Unit6 Project Folder
//
//  Created by Joseph Heydorn on 11/4/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

struct PeopleResultsData: Decodable {
    let results: [CharacterData]
}

struct CharacterData: Codable {
    let name: String
    let birth_year: String
    let homeworld: String
    let height: String
    let eye_color: String
    let hair_color: String
}

//These help balance the arrays inside of the Webmanagers
var arrayOfCharacterAttribute1 = [String]()
var arrayOfCharacterAttribute2 = [String]()
var arrayOfCharacterAttribute3 = [String]()
var arrayOfCharacterAttribute4 = [String]()
var arrayOfCharacterAttribute5 = [String]()
