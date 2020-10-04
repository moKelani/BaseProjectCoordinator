//
//  UsersInteractor.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/26/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import Foundation

class UsersInteractor {
    
    
    func getUsers(completion: @escaping (_ users: [User]?, _ error: String?) -> Void) {
        let userApi: UserAPIProtocol = UserAPI()
        userApi.getUsers { (result) in
            switch result {
            case .success(let response):
                completion(response?.data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
