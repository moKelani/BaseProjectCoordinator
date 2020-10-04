//
//  UserResponse.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/25/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import Foundation

class UserResponse: Codable {
    var data: [User]?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
