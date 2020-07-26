//
//  NewGameButton.swift
//  NumberGame
//
//  Created by Mustafa Türk on 26.07.2020.
//  Copyright © 2020 Mustafa Türk. All rights reserved.
//

import UIKit

class NewGameButton: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Yeni Oyun"
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .init(red: 255/255, green: 237/255, blue: 233/255, alpha: 1)
        return label
    }()
    
    let content = UIView()
    
    fileprivate func setup() {
        addSubview(content)
        content.addSubview(title)
        addConstraintsWithFormat(format: "H:|[v0]|", views: content)
        addConstraintsWithFormat(format: "V:|[v0]|", views: content)
        content.addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: title)
        content.addConstraintsWithFormat(format: "V:|[v0]|", views: title)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 8
        setupGradient()
        setupShadow()
    }
    
    fileprivate func setupGradient() {
        content.gradient(
            .init(red: 102/255, green: 30/255, blue: 12/255, alpha: 1),
            .init(red: 153/255, green: 45/255, blue: 19/255, alpha: 1),
            .init(red: 102/255, green: 30/255, blue: 12/255, alpha: 1),
            startPoint: CGPoint(x: 0.3, y: 0), endPoint: CGPoint(x: 1, y: 1))
        content.layer.cornerRadius = 8
        content.clipsToBounds = true
    }
    
    fileprivate func setupShadow() {
        layer.shadowColor = UIColor(red: 26/255, green: 8/255, blue: 3/255, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5
    }
}

