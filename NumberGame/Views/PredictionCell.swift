//
//  PredictionCell.swift
//  NumberGame
//
//  Created by Mustafa Türk on 26.07.2020.
//  Copyright © 2020 Mustafa Türk. All rights reserved.
//

import UIKit

class PredictionCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.font = .boldSystemFont(ofSize: 24)
        l.lineBreakMode = .byWordWrapping
        l.textColor = UIColor.init(red: 255/255, green: 237/255, blue: 233/255, alpha: 1)
        l.text = "1453"
        return l
    }()
    
    let signLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.font = .boldSystemFont(ofSize: 32)
        l.lineBreakMode = .byWordWrapping
        l.textColor = UIColor.init(red: 102/255, green: 30/255, blue: 12/255, alpha: 1)
        l.text = "+ + + -"
        l.textAlignment = .right
        return l
    }()
    
    fileprivate func setup() {
        backgroundColor = .clear
        addSubview(titleLabel)
        addSubview(signLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0][v1]-16-|", views: titleLabel, signLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: titleLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: signLabel)
    }
}
