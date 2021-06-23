//
//  FactCell.swift
//  ChuckNorrisFacts
//
//  Created by Carlos Barcelos on 22/06/21.
//

import UIKit

class FactCell: UITableViewCell {
    
    weak var delegate: FactsViewControllerDelegate?
    private var factUrl: URL?
    
    private var factLabel = UILabel()
    private var categoryLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .systemBlue
        lbl.numberOfLines = 1
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    
    private var hStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .equalSpacing
        sv.alignment = .center
        return sv
    }()
    
    private var vStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let factView: UIView = {
        let view = UIView()
        view.backgroundColor = .placeholderText
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.gray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "Fact")
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up",
                                withConfiguration: UIImage.SymbolConfiguration(pointSize: 28)),
                        for: .normal)
        button.tintColor = .black
        return button
    }()
    
    @objc private func shareButtonTapped(_ sender: UIButton) {
        delegate?.shareFact(url: factUrl)
    }
    
    func labelSizeShouldBe(_ fontSize: CGFloat) {
        factLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
    }
}

extension FactCell: ViewCode {
    func createViewsHierarchy() {
        contentView.addSubview(factView)
        
        factView.addSubview(vStack)
        vStack.addArrangedSubview(factLabel)
        vStack.addArrangedSubview(hStack)
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
            vStack.trailingAnchor.constraint(equalTo: factView.trailingAnchor, constant: -10),
            vStack.bottomAnchor.constraint(equalTo: factView.bottomAnchor, constant: -10),
            
            contentView.heightAnchor.constraint(equalTo: factView.heightAnchor, constant: 10),
        ])
    }
    
    func setAdditionalConfigurations() {
        factLabel.numberOfLines = 0
        
        selectionStyle = .none
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
    }
}
