//
//  BaseAPI.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/25/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {
    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completion:@escaping (Result<M?, Error>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders.init(target.headers ?? [:])
        let parameters = buildParameters(task: target.task)
        AF.request(target.baseURL + target.path, method: method, parameters: parameters.0, encoding: parameters.1, headers: headers).responseJSON { (response) in
            
            guard let statusCode = response.response?.statusCode else {
                return
            }
            
            if statusCode == 200 { // 200 reflect success response
                // Successful request
                guard let jsonResponse = try? response.result.get() else {
                    // ADD Custom Error
                    completion(.failure(NetworkError.responseValidationFailed))
                    return
                }
                guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {
                    // ADD Custom Error
                    completion(.failure(NetworkError.responseSerializationFailed))
                    return
                }
                guard let responseObj = try? JSONDecoder().decode(M.self, from: jsonData) else {
                    // ADD Custom Error
                    completion(.failure(NetworkError.responseParsingFailed))
                    return
                }
                completion(.success(responseObj))
            } else {
                // ADD custom error base on status code 404 / 401
                completion(.failure(NetworkError.mapError(statusCode: statusCode)))
            }
        }
    }
    
    
    
    private func buildParameters(task: Task) -> ([String: Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(let parameters, let encoding):
            return (parameters, encoding)
        }
    }
}

