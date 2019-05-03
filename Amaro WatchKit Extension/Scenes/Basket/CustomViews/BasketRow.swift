//
//  BasketRow.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Perdomo on 02/05/19.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation
import WatchKit

class BasketRow: NSObject {
    
    @IBOutlet weak var productName: WKInterfaceLabel!
    @IBOutlet weak var productSize: WKInterfaceLabel!
    @IBOutlet weak var productQuantity: WKInterfaceLabel!
    @IBOutlet weak var productGroup: WKInterfaceGroup!
    
    func setupRow(product: BasketItem) {
        if let productName = product.name {
            self.setup(name: productName)
        }
        if let productSize = product.size {
            self.setup(size: productSize)
        }
    }
    
    private func setup(name: String) {
        let attrName = NSMutableAttributedString()
        attrName.productDetailTitleAttrString(string: name, fontSize: CGFloat(integerLiteral: 14))
        productName.setAttributedText(attrName)
    }
    
    private func setup(size: String) {
        let attrAvailableSize = NSMutableAttributedString()
        attrAvailableSize.availableSizesTitleAttrString(string: amaroLocalizableString("size") + ": " + size, fontSize: CGFloat(integerLiteral: 8))
        productSize.setAttributedText(attrAvailableSize)
    }
    
}
