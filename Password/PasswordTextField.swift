//
//  PasswordTextField.swift
//  Password
//
//  Created by Paweł Łąk on 12/06/2025.
//

import Foundation

import UIKit

class PasswordTextField: UIView, UITextFieldDelegate {

    let lockImageView = UIImageView(image: UIImage(systemName: "lock.fill"))
    let textField = UITextField()
    let placeHolderText : String
    let eyeButton = UIButton(type: .custom)
    let dividerView = UIView()
    let errorLabel = UILabel()

    init(placeHolderText:String) {
        self.placeHolderText = placeHolderText
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 50)
    }
}

extension PasswordTextField {
    
    func style() {
        
        
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .green
        
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = false
        textField.placeholder = placeHolderText
         textField.delegate = self
        textField.keyboardType = .asciiCapable
        textField.attributedPlaceholder = NSAttributedString(string: placeHolderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        
        eyeButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.slash.circle"), for: .selected)
        eyeButton.addTarget(self, action: #selector(tooglePasswordView), for: .touchUpInside)
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .separator
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.text = "Enter your password test test test  test test test  test test test  test test test  test test test  test test test "
        errorLabel.textColor = .systemRed
        errorLabel.font = .preferredFont(forTextStyle: .footnote)
        errorLabel.adjustsFontSizeToFitWidth = true
        errorLabel.minimumScaleFactor = 0.8
   
        errorLabel.isHidden = false
    }
  
    
    func layout() {
     addSubview(lockImageView)
     addSubview(textField)
     addSubview(eyeButton)
     addSubview(dividerView)
     addSubview(errorLabel)
        
       
        
     NSLayoutConstraint.activate([
        lockImageView.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
        lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
        
     NSLayoutConstraint.activate([
        textField.topAnchor.constraint(equalTo: topAnchor),
        textField.leadingAnchor.constraint(equalToSystemSpacingAfter: lockImageView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            eyeButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            eyeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1),
            eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor)
           ])
        
        
        //CHRC
        
        lockImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        eyeButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        
        NSLayoutConstraint.activate([
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1)
           ])
        
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            trailingAnchor.constraint(equalTo: errorLabel.trailingAnchor, constant: 10)
          
           ])
    }
}

extension PasswordTextField{
    
    @objc func tooglePasswordView(_ sender: Any) {
        textField.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
}
