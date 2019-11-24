//
//  DataError.swift
//  Unit6 Project Folder
//
//  Created by Joseph Heydorn on 11/11/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

enum DataError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}
