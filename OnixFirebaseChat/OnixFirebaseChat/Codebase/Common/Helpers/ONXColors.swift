//
//  ONXColors.swift
//  OnixFirebaseChat
//
//  Created by Anton Dolzhenko on 07.12.16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

import UIKit

extension UIColor {
    enum ColorName: UInt32 {
        case Azure = 0x2998ffff
    }
}

extension UIColor {
    convenience init(named name: ColorName) {
        let rgbaValue = name.rawValue
        let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
        let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
        let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
        let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
