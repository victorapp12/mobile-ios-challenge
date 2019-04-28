//
//  ProductsMain.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Palhares on 28/04/2019.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation
import ObjectMapper

struct ProductsMain: Mappable {
    
    var productsMain: [Product]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        productsMain <- map["products"]
    }
    
}
