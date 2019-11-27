//
//  JSONDecoder+StarWars.swift
//  Unit6 Project Folder
//
//  Created by Dennis Parussini on 27.11.19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

//This little extension let's you use "real" Swift names in your Codable models so you don't need to add custom CodingKeys, or use snake case names
extension JSONDecoder {
    static var starwarsDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
