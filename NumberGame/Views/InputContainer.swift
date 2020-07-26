//
//  InputContainer.swift
//  NumberGame
//
//  Created by Mustafa Türk on 26.07.2020.
//  Copyright © 2020 Mustafa Türk. All rights reserved.
//

import UIKit

class InputContainer: UIView, UITextFieldDelegate {
    var delegate: InputDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Tahmininiz"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = UIColor.init(red: 255/255, green: 237/255, blue: 233/255, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    let input: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .init(red: 255/255, green: 237/255, blue: 233/255, alpha: 1)
        tf.textAlignment = .center
        tf.textColor = .black
        tf.font = .boldSystemFont(ofSize: 16)
        return tf
    }()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 4
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count == 4 {
            textField.endEditing(true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard
            let delegate = delegate,
            let inputReceived = delegate.inputReceived
            else { return }
        inputReceived(self, textField.text)
    }
    
    fileprivate func setup() {
        addSubview(title)
        addSubview(input)
        input.delegate = self
        input.layer.zPosition = 1000
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: title)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: input)
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-|", views: title, input)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupBorder()
        setupShadow()
    }
    
    fileprivate func setupShadow() {
        input.layer.shadowColor = UIColor(red: 26/255, green: 8/255, blue: 3/255, alpha: 1).cgColor
        input.layer.shadowOffset = CGSize(width: 5, height: 5)
        input.layer.shadowOpacity = 0.3
        input.layer.shadowRadius = 5
    }
    
    fileprivate func setupBorder() {
        input.layer.cornerRadius = 8
        input.layer.borderWidth = 1
        input.layer.borderColor = UIColor.init(red: 44/255, green: 44/255, blue: 44/255, alpha: 0.2).cgColor
    }
}

