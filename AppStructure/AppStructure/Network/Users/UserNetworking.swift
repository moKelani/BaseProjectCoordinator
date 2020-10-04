//
//  UserNetworking.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/25/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import Foundation
import Alamofire

enum UserNetworking {
    case getUser
    case createUser(name: String, job: String)
}

extension UserNetworking: TargetType {
    var baseURL: String {
        switch self {
        default:
            return "https://reqres.in/api"
        }
    }
    
    var path: String {
        switch self {
        case .getUser:
            return "/users"
        case .createUser:
            return "/users"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUser:
            return .get
        case .createUser:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .getUser:
            return .requestPlain
        case .createUser(let name, let job):
            return .requestParameters(["name": name, "job": job], JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
    
}
