//
//  InputDelegate.swift
//  NumberGame
//
//  Created by Mustafa Türk on 27.07.2020.
//  Copyright © 2020 Mustafa Türk. All rights reserved.
//

import UIKit

@objc protocol InputDelegate {
    @objc optional func inputReceived(_ inputContainer: InputContainer, value: String?)
}
