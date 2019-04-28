//
//  Product.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Palhares on 27/04/2019.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation
import ObjectMapper

struct Product : Mappable {
    var name : String?
    var style : String?
    var code_color : String?
    var color_slug : String?
    var color : String?
    var on_sale : Bool?
    var regular_price : String?
    var actual_price : String?
    var discount_percentage : String?
    var installments : String?
    var image : String?
    var sizes : [Size]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        name <- map["name"]
        style <- map["style"]
        code_color <- map["code_color"]
        color_slug <- map["color_slug"]
        color <- map["color"]
        on_sale <- map["on_sale"]
        regular_price <- map["regular_price"]
        actual_price <- map["actual_price"]
        discount_percentage <- map["discount_percentage"]
        installments <- map["installments"]
        image <- map["image"]
        sizes <- map["sizes"]
    }
    
}
