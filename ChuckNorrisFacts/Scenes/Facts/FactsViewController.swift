//
//  FactsViewController.swift
//  ChuckNorrisFacts
//
//  Created by Carlos Barcelos on 22/06/21.
//

import UIKit

protocol FactsViewControllerDelegate: AnyObject {
    func shareFact(url: URL?)
    func navigateToSearchScreen()
    func reloadTVWithNewData(data: [Fact])
}

class FactsViewController: UITableViewController, FactsViewControllerDelegate {
    
    var chuckNorrisFacts = [Fact]()
    var rows = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FactCell.self, forCellReuseIdentifier: "Fact")
        tableView.register(EmptyCell.self, forCellReuseIdentifier: "Empty")
        
        title = "CHUCK NORRIS FACTS"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(navigateToSearchScreen))
        tableView.separatorStyle = .none
    }
    
    func shareFact(url: URL?) {
        guard let url = url else { return }
        let vc = UIActivityViewController(activityItems: [url], applicationActivities: [])
        present(vc, animated: true)
    }
    
    @objc func navigateToSearchScreen() {
        let vc = SearchViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func reloadTVWithNewData(data: [Fact]) {
        chuckNorrisFacts = data
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !chuckNorrisFacts.isEmpty {
            rows = chuckNorrisFacts.count
        } else {
            rows = 1
        }
        return rows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !chuckNorrisFacts.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Fact", for: indexPath) as! FactCell
            cell.delegate = self
            cell.setupCell(fact: chuckNorrisFacts[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Empty") as! EmptyCell
            cell.delegate = self
            return cell
        }
    }   
}
