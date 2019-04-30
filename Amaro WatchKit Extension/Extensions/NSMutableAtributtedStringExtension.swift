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
    
    func productTitleAttrString(string: String, fontSize:CGFloat) {
        self.append(NSAttributedString.init(string: string, attributes: [NSAttributedString.Key.foregroundColor:UIColor.fromHex("#000000"), .font: UIFont.san_openSansRegular(ofSize: fontSize)]))
    }
    
}
