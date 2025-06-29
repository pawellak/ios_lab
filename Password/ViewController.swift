//
//  ViewController.swift
//  Password
//
//  Created by Paweł Łąk on 12/06/2025.
//

import UIKit

class ViewController: UIViewController {
    
    let newPasswordTextFied = PasswordTextField(placeHolderText: "New Password")
//    let criteriaView = PasswordCriteriaView(text: "upper case (A-Z)")
    let statusView = PasswordStatusView()
    
    let confirmPasswordTextFied = PasswordTextField(placeHolderText: "Re-enter new password")
    
    let resetButton = UIButton(type: .system)
     
    let stackVIew = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}


//
 

extension ViewController
{
    func style() {
        stackVIew.translatesAutoresizingMaskIntoConstraints = false
        newPasswordTextFied.translatesAutoresizingMaskIntoConstraints = false
        newPasswordTextFied.delegate = self
        
        statusView.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
//      criteriaView.translatesAutoresizingMaskIntoConstraints = false
        stackVIew.axis = .vertical
        stackVIew.spacing = 20
        stackVIew.clipsToBounds = true
        stackVIew.layer.cornerRadius = 8
        

        
        resetButton.setTitle("Reset Password", for: [])
        resetButton.configuration = .filled()
        
        
    }
    
    func layout() {
        stackVIew.addArrangedSubview(newPasswordTextFied)
        stackVIew.addArrangedSubview(statusView)
        stackVIew.addArrangedSubview(confirmPasswordTextFied)
        stackVIew.addArrangedSubview(resetButton)
        
        
        view.addSubview(stackVIew)
        
        NSLayoutConstraint.activate([
            stackVIew.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackVIew.trailingAnchor, multiplier: 2),
            stackVIew.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
}

extension ViewController : PasswordTextFieldDelegate
{
    func editingChanged(_ sender: PasswordTextField) {
       if sender === newPasswordTextFied {
           statusView.updateDisplay(sender.textField.text ?? "")
        }
    }
}
