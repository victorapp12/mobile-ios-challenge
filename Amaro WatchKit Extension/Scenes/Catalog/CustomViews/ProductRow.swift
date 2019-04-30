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
    
    @IBOutlet weak var productRow: WKInterfaceGroup!
    
    func setupRow(with product: Product) {
        if let image = product.image {
            setup(image: image)
        }
        if let name = product.name {
            setup(name: name)
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

}

/*
 {
 "name": "VESTIDO TRANSPASSE BOW",
 "style": "20002605",
 "code_color": "20002605_613",
 "color_slug": "tapecaria",
 "color": "TAPEÇARIA",
 "on_sale": false,
 "regular_price": "R$ 199,90",
 "actual_price": "R$ 199,90",
 "discount_percentage": "",
 "installments": "3x R$ 66,63",
 "image": "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912",
 "sizes": [
 {
 "available": false,
 "size": "PP",
 "sku": "5807_343_0_PP"
 },
 {
 "available": true,
 "size": "P",
 "sku": "5807_343_0_P"
 },
 {
 "available": true,
 "size": "M",
 "sku": "5807_343_0_M"
 },
 {
 "available": true,
 "size": "G",
 "sku": "5807_343_0_G"
 },
 {
 "available": false,
 "size": "GG",
 "sku": "5807_343_0_GG"
 }
 ]
 },
 */




