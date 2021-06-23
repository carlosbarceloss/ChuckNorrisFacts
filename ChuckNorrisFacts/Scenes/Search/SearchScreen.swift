//
//  SearchView.swift
//  ChuckNorrisFacts
//
//  Created by Carlos Barcelos on 22/06/21.
//

import UIKit

class SearchScreen: UIView {
    
    private var mainVStack: UIStackView!
    private var subVStack: UIStackView!
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "chucknorris_logo")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var label: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.text = "Pesquisar Fato"
        lb.textAlignment = .center
        lb.font = UIFont.boldSystemFont(ofSize: 30)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var textField: UITextField = {
        let tf = UITextField()
        tf.layer.borderWidth = 1.5
        tf.layer.borderColor = UIColor.gray.cgColor
        tf.font = UIFont.systemFont(ofSize: 24)
        tf.adjustsFontSizeToFitWidth = true
        tf.textAlignment = .center
        tf.returnKeyType = .search
        tf.autocapitalizationType = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var searchButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Pesquisar", for: .normal)
        btn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        btn.backgroundColor = .orange
        btn.tintColor = .white
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchScreen: ViewCode {
    func createViewsHierarchy() {
        mainVStack = UIStackView()
        subVStack = UIStackView()
        
        mainVStack.axis = .vertical
        mainVStack.distribution = .fill
        mainVStack.spacing = 10
        mainVStack.translatesAutoresizingMaskIntoConstraints = false
        
        subVStack.axis = .vertical
        subVStack.alignment = .center
        subVStack.spacing = 5
        
        addSubview(mainVStack)
        mainVStack.addArrangedSubview(imageView)
        mainVStack.addArrangedSubview(subVStack)
        subVStack.addArrangedSubview(label)
        subVStack.addArrangedSubview(textField)
        subVStack.addArrangedSubview(searchButton)
    }
    
    func setupConstraints() {

        NSLayoutConstraint.activate([
            mainVStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            mainVStack.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            mainVStack.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            
            imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 150),
            
            textField.widthAnchor.constraint(equalTo: subVStack.widthAnchor, multiplier: 5/6),
            textField.heightAnchor.constraint(equalToConstant: 35),
            
            searchButton.widthAnchor.constraint(equalTo: textField.widthAnchor, multiplier: 0.5),
            searchButton.heightAnchor.constraint(equalTo: textField.heightAnchor)
            
        ])
    }
    
    func setAdditionalConfigurations() {
        backgroundColor = .white
    }
}
