//
//  UserAPI.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/25/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import Foundation

protocol UserAPIProtocol {
    func getUsers(completion: @escaping (Result<UserResponse?, Error>) -> Void)
}


class UserAPI: BaseAPI<UserNetworking>, UserAPIProtocol {
    
    //MARK:- Requests
    
    func getUsers(completion: @escaping (Result<UserResponse?, Error>) -> Void) {
        self.fetchData(target: .getUser, responseClass: UserResponse.self) { (result) in
            completion(result)
        }
    }
}
