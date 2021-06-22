//
//  APIErrors.swift
//  ChuckNorrisFacts
//
//  Created by Carlos Barcelos on 22/06/21.
//

import Foundation

enum APIErrors: Error {
    case invalidURL
    case backendError(statusCode: Int)
}
