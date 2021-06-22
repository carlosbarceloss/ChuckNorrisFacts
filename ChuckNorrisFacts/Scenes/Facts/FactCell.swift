//
//  FactCell.swift
//  ChuckNorrisFacts
//
//  Created by Carlos Barcelos on 22/06/21.
//

import UIKit

class FactCell: UITableViewCell {
    private var factLabel = UILabel()
    private var categoryLabel = UILabel()
    private var factUrl: URL?
    private var hStack: UIStackView!
    private var vStack: UIStackView!
    weak var shareDelegate: ShareDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
    }
    
    func setupCell(fact: Fact) {
        factLabel.text = fact.value
        
        categoryLabel.text = {
            if fact.categories.isEmpty {
                return "  UNCATEGORIZED  "
            } else {
                return "  \(fact.categories[0].uppercased())  "
            }
        }()

        factUrl = URL(string: fact.url)
        
        
        if fact.value.utf16.count > 80 {
            labelSizeShouldBe(22)
        } else {
            labelSizeShouldBe(32)
        }
    }
    
    private let factView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up",
                                withConfiguration: UIImage.SymbolConfiguration(pointSize: 28)),
                        for: .normal)
        button.tintColor = .black
        return button
    }()
    
    @objc private func shareButtonTapped(_ sender: UIButton) {
        shareDelegate.shareFact(url: factUrl)
    }
    
    func labelSizeShouldBe(_ fontSize: CGFloat) {
        factLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
    }
}

extension FactCell: ViewCode {
    func createViewsHierarchy() {
        addSubview(factView)
        
        vStack = UIStackView()
        hStack = UIStackView()
        factView.addSubview(vStack)
        
        vStack.axis = .vertical
        vStack.distribution = .fill
        vStack.spacing = 10
        vStack.addArrangedSubview(factLabel)
        vStack.addArrangedSubview(hStack)
        
        hStack.axis = .horizontal
        hStack.distribution = .equalSpacing
        hStack.alignment = .center
        hStack.addArrangedSubview(categoryLabel)
        hStack.addArrangedSubview(shareButton)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            factView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            factView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            factView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            vStack.leadingAnchor.constraint(equalTo: factView.leadingAnchor, constant: 10),
            vStack.topAnchor.constraint(equalTo: factView.topAnchor, constant: 10),
            vStack.trailingAnchor.constraint(equalTo: factView.leadingAnchor, constant: -10),
            vStack.bottomAnchor.constraint(equalTo: factView.bottomAnchor, constant: -10),
            
            heightAnchor.constraint(equalTo: factView.heightAnchor, constant: 10),
        ])


    }
    
    func setAdditionalConfigurations() {
        factView.backgroundColor = .placeholderText
        factView.layer.borderWidth = 2
        factView.layer.borderColor = UIColor.gray.cgColor
        
        factLabel.numberOfLines = 0
        
        categoryLabel.backgroundColor = .systemBlue
        categoryLabel.numberOfLines = 1
        categoryLabel.textColor = .white
        categoryLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    
}
