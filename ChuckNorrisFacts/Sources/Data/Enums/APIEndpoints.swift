//
//  APIEndpoints.swift
//  ChuckNorrisFacts
//
//  Created by Carlos Barcelos on 22/06/21.
//

import Foundation

enum APIEndpoints {
    case search
}

extension APIEndpoints: Endpoint {
    var path: String {
        switch self {
        case .search:
            return "/jokes/search"
        }
    }

    var method: String {
        return "get"
    }

    var url: URLComponents {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "api.chucknorris.io"
        component.path = path
        component.query = "query"
        return component
    }
}
