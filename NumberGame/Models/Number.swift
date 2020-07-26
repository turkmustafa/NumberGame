//
//  Number.swift
//  NumberGame
//
//  Created by Mustafa Türk on 26.07.2020.
//  Copyright © 2020 Mustafa Türk. All rights reserved.
//

import UIKit

class Number {
    var value: [Int] = []
    
    init(string: String? = nil) {
        guard let string = string else { return }
        for char in string {
            if let numberValue = char.wholeNumberValue {
                value.append(numberValue)
            }
        }
    }
    
    func toString() -> String {
        var string = ""
        for each in value {
            string += "\(each)"
        }
        return string
    }
    
    func generate() {
        value = []
        value.append(Int.random(in: 1...9))
        while value.count < 4 {
            var random: Int = Int.random(in: 0...9)
            while value.contains(random) {
                random = Int.random(in: 0...9)
            }
            value.append(random)
        }
    }
    
    func compare(with: Number) -> String {
        var result = ""
        for (index, each) in with.value.enumerated() {
            if value.contains(each) {
                result += value[index] == each ? "+" : "-"
            }
        }
        return result
    }
}
