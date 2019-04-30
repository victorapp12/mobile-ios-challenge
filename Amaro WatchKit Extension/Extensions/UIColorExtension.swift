//
//  UIColorExtension.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Perdomo on 30/04/19.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation
import UIKit

extension CGColor {
    func toUIColor() -> UIColor {
        return UIColor(cgColor: self)
    }
}

extension UIColor {
    
    static func fromHex(_ hexColor: String) -> UIColor {
        var rgbValue: UInt32 = 0
        Scanner(string: hexColor.replacingOccurrences(of: "#", with: "")).scanHexInt32(&rgbValue)
        
        let components = (
            R: CGFloat((rgbValue >> 16) & 0xff) / 255,
            G: CGFloat((rgbValue >> 08) & 0xff) / 255,
            B: CGFloat((rgbValue >> 00) & 0xff) / 255
        )
        
        let cgColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [components.R, components.G, components.B, 1])!
        
        return cgColor.toUIColor()
    }
}
