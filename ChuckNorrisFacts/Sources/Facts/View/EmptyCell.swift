//
//  EmptyCell.swift
//  ChuckNorrisFacts
//
//  Created by Carlos Barcelos on 22/06/21.
//

import UIKit

class EmptyCell: UITableViewCell {
    weak var delegate: FactsViewControllerDelegate?
    private var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Primeiro acesso, clique para pesquisar fatos", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style _: UITableViewCell.CellStyle, reuseIdentifier _: String?) {
        super.init(style: .default, reuseIdentifier: "Empty")
        setupView()
    }

    @objc func delegateNavigation() {
        delegate?.navigateToSearchScreen()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmptyCell: ViewCode {
    func createViewsHierarchy() {
        contentView.addSubview(button)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalTo: contentView.layoutMarginsGuide.widthAnchor),

            contentView.heightAnchor.constraint(equalTo: button.heightAnchor, constant: 10)
        ])
    }

    func setAdditionalConfigurations() {
        button.addTarget(self, action: #selector(delegateNavigation), for: .touchUpInside)
        selectionStyle = .none
    }
}
