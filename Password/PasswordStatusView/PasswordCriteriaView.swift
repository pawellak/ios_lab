//
//  PasswordCriteriaView.swift
//  Password
//
//  Created by Paweł Łąk on 13/06/2025.
//

import Foundation
import UIKit

class PasswordCriteriaView : UIView {
    
    let stackView = UIStackView()
    let image = UIImageView()
    let label = UILabel()
    
    let checkMarkImage = UIImage(systemName: "checkmark.circle")?.withTintColor(.systemGreen,renderingMode: .alwaysOriginal)
    let xmarkImage = UIImage(systemName: "xmark.circle")?.withTintColor(.systemRed,renderingMode: .alwaysOriginal)
    let circleImage = UIImage(systemName: "circle")?.withTintColor(.tertiaryLabel   ,renderingMode: .alwaysOriginal)
    
    init(text:String) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isCriteriaMet: Bool = false {
        didSet {
            image.image = isCriteriaMet ? checkMarkImage : xmarkImage
        }
    }
    
    func reset() {
        isCriteriaMet = false
        image.image = circleImage
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 50)
    }
}

extension PasswordCriteriaView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .yellow
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle")?.withTintColor(.red,renderingMode: .alwaysOriginal)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
    }
    
    func layout() {
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(label)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        image.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        image.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
    }
}
