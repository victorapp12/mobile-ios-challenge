//
//  NSMutableAtributtedStringExtension.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Perdomo on 30/04/19.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    func productTitleAttrString(string: String, fontSize: CGFloat) {
        self.append(NSAttributedString.init(string: string, attributes: [NSAttributedString.Key.foregroundColor:UIColor.fromHex("#000000"), .font: UIFont.amr_openSansRegular(ofSize: fontSize)]))
    }
    
    func  productPriceAttrString(string: String, fontSize: CGFloat) {
        self.append(NSAttributedString.init(string: string, attributes: [NSAttributedString.Key.foregroundColor:UIColor.fromHex("#000000"), .font: UIFont.amr_openSansSemiBold(ofSize: fontSize)]))
    }
    
    func productInstallmentsAttrString(string: String, fontSize: CGFloat) {
        self.append(NSAttributedString.init(string: string, attributes: [NSAttributedString.Key.foregroundColor:UIColor.fromHex("#999999"), .font: UIFont.amr_openSansLight(ofSize: fontSize)]))
    }
    
    func productRegularPriceAttrString(string: String, fontSize: CGFloat) {
        self.append(NSAttributedString.init(string: string, attributes: [NSAttributedString.Key.foregroundColor:UIColor.fromHex("#999999"), .font: UIFont.amr_openSansLight(ofSize: fontSize)]))
        self.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, string.count))
    }
    
    func  productDiscountPercentageAttrString(string: String, fontSize: CGFloat) {
        self.append(NSAttributedString.init(string: string, attributes: [NSAttributedString.Key.foregroundColor:UIColor.fromHex("#cf3838"), .font: UIFont.amr_openSansSemiBold(ofSize: fontSize)]))
    }
    
}
