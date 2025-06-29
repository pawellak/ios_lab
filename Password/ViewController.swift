//
//  ViewController.swift
//  Password
//
//  Created by Paweł Łąk on 12/06/2025.
//

import UIKit

class ViewController: UIViewController {
    
    typealias CustomValidation = PasswordTextField.CustomValidation
    
    
    
    let newPasswordTextFied = PasswordTextField(placeHolderText: "New Password")
    let statusView = PasswordStatusView()
    let confirmPasswordTextFied = PasswordTextField(placeHolderText: "Re-enter new password")
    let resetButton = UIButton(type: .system)
    let stackVIew = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
}

extension ViewController
{
    func style() {
        stackVIew.translatesAutoresizingMaskIntoConstraints = false
        newPasswordTextFied.translatesAutoresizingMaskIntoConstraints = false
        
        statusView.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackVIew.axis = .vertical
        stackVIew.spacing = 20
        stackVIew.clipsToBounds = true
        stackVIew.layer.cornerRadius = 8
        resetButton.setTitle("Reset Password", for: [])
        resetButton.configuration = .filled()
    }
    
    func setup(){
        setupNewPassword()
        setupConfirmPassword()
        setupDismissKeyboardGesture()
        setupDissmissKeyboardGesture()
    }
    
    private func setupNewPassword() {
        let newPasswordValidation: CustomValidation = { text in
            
            // Empty text
            guard let text = text, !text.isEmpty else {
                self.statusView.reset()
                return (false, "Enter your password")
            }
            
            // Valid characters
            let validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,@:?!()$\\/#"
            let invalidSet = CharacterSet(charactersIn: validChars).inverted
            guard text.rangeOfCharacter(from: invalidSet) == nil else {
                self.statusView.reset()
                return (false, "Enter valid special chars (.,@:?!()$\\/#) with no spaces")
            }
            
            // Criteria met
            self.statusView.updateDisplay(text)
            if !self.statusView.validate(text) {
                return (false, "Your password must meet the requirements below")
            }
            
            return (true, "")
        }
        
        newPasswordTextFied.customValidation = newPasswordValidation
        newPasswordTextFied.delegate = self
    }
    
    private func setupConfirmPassword() {
        let confirmPasswordValidation: CustomValidation = { text in
            guard let text = text, !text.isEmpty else {
                return (false, "Enter your password.")
            }

            guard text == self.newPasswordTextFied.text else {
                return (false, "Passwords do not match.")
            }

            return (true, "")
        }

        confirmPasswordTextFied.customValidation = confirmPasswordValidation
        confirmPasswordTextFied.delegate = self
    }

    private func setupDismissKeyboardGesture() {
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_: )))
        view.addGestureRecognizer(dismissKeyboardTap)
    }
    
    @objc func viewTapped(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true) // resign first responder
    }
    
    private func setupDissmissKeyboardGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func dismissKeyboard(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
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
    
    func editingDidEnd(_ sender: PasswordTextField) {
        if sender === newPasswordTextFied {
            statusView.shouldResetCriteria = false
            _ = newPasswordTextFied.validate()
        } else if sender == confirmPasswordTextFied {
            _ = confirmPasswordTextFied.validate()
        }
    }
}
