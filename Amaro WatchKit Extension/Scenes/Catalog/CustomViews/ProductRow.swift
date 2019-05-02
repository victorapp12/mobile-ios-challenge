//
//  ProductRow.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Palhares on 28/04/2019.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation
import WatchKit
import Kingfisher
import WatchActiviyIndicator

class ProductRow: NSObject {
    
    @IBOutlet weak var productImage: WKInterfaceImage!
    @IBOutlet weak var productName: WKInterfaceLabel!
    @IBOutlet weak var productPrice: WKInterfaceLabel!
    @IBOutlet weak var productDiscount: WKInterfaceLabel! {
        didSet {
            self.productDiscount.setHidden(true)
        }
    }
    
    @IBOutlet weak var productRow: WKInterfaceGroup!
    
    func setupRow(with product: Product) {
        //Setup Product Image
        if let image = product.image {
            setup(image: image)
        }
        //Setup Product Name
        if let name = product.name {
            setup(name: name)
        }
        //Setup Product Actual Price
        setup(actualPrice: product.actual_price ?? "",
              installments: product.installments ?? "")
        //Setup Product Discount
        if let onSale = product.on_sale, onSale == true {
            setup(discount: product.regular_price ?? "", discountPercentage: product.discount_percentage ?? "")
        }
    }
    
    private func setup(image: String) {
        let url = URL(string: image)
        productImage.startAnimating()
        productImage.kf.setImage(with: url,
                                 placeholder: UIImage(named: "placeholderImage"),
                                 options: [.cacheOriginalImage,
                                           .forceTransition]
        ) {
            result in
            switch result {
            case .success(_):
                self.productImage.stopAnimating()
                //Loading stop
                break
            case .failure(_):
                self.productImage.stopAnimating()
                //Loading stop
                break
            }
        }
    }
    
    private func setup(name: String) {
        let attrName = NSMutableAttributedString()
        attrName.productTitleAttrString(string: name, fontSize: CGFloat(integerLiteral: 14))
        productName.setAttributedText(attrName)
    }
    
    private func setup(actualPrice: String, installments: String) {
        let attrPrice = NSMutableAttributedString()
        let attrInstallment = NSMutableAttributedString()
        if actualPrice != "" {
            attrPrice.productPriceAttrString(string: actualPrice, fontSize: 12)
        }
        if installments != "" {
            attrInstallment.productInstallmentsAttrString(string: " " + installments, fontSize: 10)
        }
        productPrice.setAttributedText(concatenateAttributedStrings(attrPrice, attrInstallment))
    }
    
    private func setup(discount regularPrice: String, discountPercentage: String) {
        if discountPercentage == "" {
            return
        }
        self.productDiscount.setHidden(false)
        let attrRegularPrice = NSMutableAttributedString()
        let attrDiscountPercentage = NSMutableAttributedString()
        if regularPrice != "" {
            attrRegularPrice.productRegularPriceAttrString(string: regularPrice, fontSize: 12)
        }
        attrDiscountPercentage.productDiscountPercentageAttrString(string: " (" + discountPercentage + " off)", fontSize: 12)
        self.productDiscount.setAttributedText(concatenateAttributedStrings(attrRegularPrice, attrDiscountPercentage))
    }
    
    private func concatenateAttributedStrings(_ left: NSAttributedString, _ right: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.append(left)
        result.append(right)
        return result
    }

}

/*
 {
 "name": "T-SHIRT LEATHER DULL",
 "style": "20002602",
 "code_color": "20002602_027",
 "color_slug": "marinho",
 "color": "MARINHO",
 "on_sale": true,
 "regular_price": "R$ 139,90",
 "actual_price": "R$ 119,90",
 "discount_percentage": "12%",
 "installments": "3x R$ 39,97",
 "image": "",
 "sizes": [
 {
 "available": true,
 "size": "PP",
 "sku": "5793_1000032_0_PP"
 },
 {
 "available": true,
 "size": "P",
 "sku": "5793_1000032_0_P"
 },
 {
 "available": true,
 "size": "M",
 "sku": "5793_1000032_0_M"
 },
 {
 "available": false,
 "size": "G",
 "sku": "5793_1000032_0_G"
 },
 {
 "available": false,
 "size": "GG",
 "sku": "5793_1000032_0_GG"
 }
 ]
 }
 */




