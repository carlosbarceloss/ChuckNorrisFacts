//
//  Endpoint.swift
//  ChuckNorrisFacts
//
//  Created by Carlos Barcelos on 22/06/21.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: String { get }
}
