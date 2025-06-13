//
//  ViewController.swift
//  Password
//
//  Created by Paweł Łąk on 12/06/2025.
//

import UIKit

class ViewController: UIViewController {
    
    let newPasswordTextFied = PasswordTextField(placeHolderText: "New Password")
    let criteriaView = PasswordCriteriaView(text: "upper case (A-Z)")
    let stackVIew = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController
{
    func style() {
        stackVIew.translatesAutoresizingMaskIntoConstraints = false
        newPasswordTextFied.translatesAutoresizingMaskIntoConstraints = false
        criteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        stackVIew.axis = .vertical
        stackVIew.spacing = 20
    }
    
    func layout() {
        stackVIew.addArrangedSubview(newPasswordTextFied)
        stackVIew.addArrangedSubview(criteriaView)
        
        view.addSubview(stackVIew)
        
        NSLayoutConstraint.activate([
            stackVIew.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackVIew.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: newPasswordTextFied.trailingAnchor, multiplier: 1),
        ])
    }
}
