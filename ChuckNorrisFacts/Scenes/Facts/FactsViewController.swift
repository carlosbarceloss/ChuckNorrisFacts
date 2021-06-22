//
//  FactsViewController.swift
//  ChuckNorrisFacts
//
//  Created by Carlos Barcelos on 22/06/21.
//

import UIKit

protocol ShareDelegate: AnyObject {
    func shareFact(url: URL?)
}

class FactsViewController: UITableViewController, ShareDelegate {
    
    var chuckNorrisFacts = [Fact]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CHUCK NORRIS FACTS"
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func shareFact(url: URL?) {
        guard let url = url else { return }
        let vc = UIActivityViewController(activityItems: [url], applicationActivities: [])
        present(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chuckNorrisFacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Fact", for: indexPath) as! FactCell
        cell.selectionStyle = .none
        cell.shareDelegate = self
        cell.setupCell(fact: chuckNorrisFacts[indexPath.row])
        return cell
    }   
}
