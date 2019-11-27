//
//  CharacterData.swift
//  Unit6 Project Folder
//
//  Created by Joseph Heydorn on 11/4/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

//Those could be simplified using generics and protocols. Let me know if you like me to show you how.
struct PeopleResultsData: Decodable {
    let results: [Character]
}

//Let's make this more "Swifty"
struct Character: Codable {
    let name: String
    let birthYear: String
    let homeworld: String?
    let height: String
    let eyeColor: String
    let hairColor: String
}
