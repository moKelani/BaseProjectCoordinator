//
//  Error.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/25/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case unauthorized
    case notFound
    case serviceNotAvailable
    case notConnectedToInternet
    case responseValidationFailed
    case responseSerializationFailed
    case responseParsingFailed
    case somethingWentWrong(String)

    static func mapError(statusCode: Int) -> NetworkError {
        switch statusCode {
        case 401:
            return .unauthorized
        case 404:
            return .notFound
        case 501:
            return .serviceNotAvailable
        case -1009:
            return .notConnectedToInternet
        default:
            return .somethingWentWrong("Something went wrong. Please try again.")
        }
    }

    var localizedDescription: String {
        switch self {
        case .unauthorized:
            return "Unauthorised response from the server"
        case .notConnectedToInternet:
            return "Not connected to Internet"
        case .serviceNotAvailable:
            return "Service is not available. Try later"
        case .somethingWentWrong(let errorMessage):
            return errorMessage
        case .responseValidationFailed:
            return "Response result failed"
        case .responseSerializationFailed:
            return "Response serialization failed"
        case .responseParsingFailed:
            return "Response parsing failed"
        case .notFound:
            return "URL Request not found"
        }
    }
}
