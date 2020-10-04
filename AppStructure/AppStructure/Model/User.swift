//
//  User.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/25/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import Foundation

class User: Codable {
    var firstName: String?
    var lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

