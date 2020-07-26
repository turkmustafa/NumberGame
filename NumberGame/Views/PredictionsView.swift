//
//  PredictionsView.swift
//  NumberGame
//
//  Created by Mustafa Türk on 26.07.2020.
//  Copyright © 2020 Mustafa Türk. All rights reserved.
//

import UIKit

class PredictionsView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var number = Number()
    
    var data: [Number] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Önceki Tahminleriniz"
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = UIColor.init(red: 255/255, green: 237/255, blue: 233/255, alpha: 1)
        return label
    }()
    
    let separator: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.init(red: 255/255, green: 165/255, blue: 143/255, alpha: 1)
        return v
    }()
    
    // MARK: - TableView
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PredictionCell.self, forCellReuseIdentifier: "predictionCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 56
        tableView.separatorColor = UIColor.init(red: 255/255, green: 165/255, blue: 143/255, alpha: 0.9)
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "predictionCell", for: indexPath) as! PredictionCell
        cell.titleLabel.text = "\(data[indexPath.row].toString())"
        cell.signLabel.text = number.compare(with: data[indexPath.row])
        return cell
    }
    
    fileprivate func setup() {
        addSubview(title)
        addSubview(tableView)
        addSubview(separator)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separator)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: title)
        addConstraintsWithFormat(format: "H:|[v0]|", views: tableView)
        addConstraintsWithFormat(format: "V:|[v0(44)]-8-[v1(1)][v2]|", views: title, separator, tableView)
    }
    
    
    
}
