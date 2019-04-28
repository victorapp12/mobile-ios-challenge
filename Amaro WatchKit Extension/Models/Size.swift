//
//  Sizes.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Palhares on 27/04/2019.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation
import ObjectMapper

struct Size : Mappable {
    
    var available : Bool?
    var size : String?
    var sku : String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        available <- map["available"]
        size <- map["size"]
        sku <- map["sku"]
        
    }
    
}
