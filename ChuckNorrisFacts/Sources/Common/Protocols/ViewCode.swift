//
//  ViewCode.swift
//  ChuckNorrisFacts
//
//  Created by Carlos Barcelos on 22/06/21.
//

import Foundation

protocol ViewCode {
    func createViewsHierarchy()
    func setupConstraints()
    func setAdditionalConfigurations()
    func setupView()
}

extension ViewCode {
    func setupView() {
        createViewsHierarchy()
        setupConstraints()
        setAdditionalConfigurations()
    }
}
