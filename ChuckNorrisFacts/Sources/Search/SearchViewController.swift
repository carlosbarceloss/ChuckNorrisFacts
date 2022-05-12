//
//  SearchViewController.swift
//  ChuckNorrisFacts
//
//  Created by Carlos Barcelos on 22/06/21.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    let screen = SearchScreen()
    let service = Service()
    weak var delegate: FactsViewControllerDelegate?

    override func loadView() {
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen.textField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        screen.searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
    }

    func searchByQuery(_ query: String, type: APIEndpoints) {
        switch type {
        case .search:
            service.makeRequest(endPoint: type, fragment: query) { (result: Result<Facts, APIErrors>) in
                switch result {
                case let .success(facts):
                    DispatchQueue.main.async { [weak self] in
                        self?.delegate?.reloadTVWithNewData(data: facts.result)
                        self?.navigationController?.popToRootViewController(animated: true)
                        return
                    }

                case let .failure(error):
                    switch error {
                    case let .backendError(statusCode: statusCode):
                        print("error statuscode: \(statusCode)")
                    default:
                        break
                    }
                }
            }
        }
    }

    @objc func searchButtonPressed(_: UIButton? = nil) {
        guard screen.textField.text != "" else {
            print("textfield vazio")
            return
        }
        guard screen.textField.text!.utf16.count >= 3 else {
            print("menor que 3 char")
            return
        }

        if let query = screen.textField.text {
            return searchByQuery(query, type: .search)
        }
    }

    func textFieldError(message _: String) {}

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc func textFieldShouldReturn(_: UITextField) -> Bool {
        view.endEditing(true)
        searchButtonPressed()
        return false
    }
}
