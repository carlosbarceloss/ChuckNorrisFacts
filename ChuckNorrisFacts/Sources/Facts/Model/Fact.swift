//
//  Fact.swift
//  ChuckNorrisFacts
//
//  Created by Carlos Barcelos on 22/06/21.
//

import Foundation

struct Fact: Decodable {
    let categories: [String]
    let value: String
    let url: String
}
