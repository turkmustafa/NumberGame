//
//  UIView+.swift
//  NumberGame
//
//  Created by Mustafa Türk on 26.07.2020.
//  Copyright © 2020 Mustafa Türk. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func gradient(_ colors: UIColor..., startPoint: CGPoint, endPoint: CGPoint) {
        let gl = CAGradientLayer()
        gl.colors = colors.map{$0.cgColor}
        var locations = [NSNumber]()
        let offset = 1/(Double(colors.count)-1)
        for i in 0...colors.count-1 {
            locations.append(NSNumber(value: Double(i) * offset))
        }
        gl.locations = locations
        gl.startPoint = startPoint
        gl.endPoint = endPoint
        gl.frame = self.bounds
        self.layer.insertSublayer(gl, at: 0)
    }
}
