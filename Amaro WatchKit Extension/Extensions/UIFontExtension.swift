//
//  UIFontExtension.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Perdomo on 30/04/19.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    public static func amr_openSansRegular(ofSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: "OpenSans-Regular", size: size) {
            return font
        }
        return UIFont.systemFont(ofSize:size, weight: .regular)
    }
    
    public static func amr_openSansBold(ofSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: "OpenSans-Bold", size: size) {
            return font
        }
        return UIFont.boldSystemFont(ofSize:size)
    }
    
    public static func amr_openSansSemiBold(ofSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: "OpenSans-SemiBold", size: size) {
            return font
        }
        return UIFont.systemFont(ofSize:size, weight: .semibold)
    }
    
    public static func amr_openSansLight(ofSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: "OpenSans-Light", size: size) {
            return font
        }
        return UIFont.systemFont(ofSize:size, weight: .light)
    }
}
