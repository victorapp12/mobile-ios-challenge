//
//  BasketItem.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Perdomo on 02/05/19.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation

class BasketItem: NSObject, NSCoding {
    
    var name : String?
    var sku : String?
    var size : String?
    
    init(name: String, sku: String, size: String) {
        self.name = name
        self.sku = sku
        self.size = size
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        self.sku = aDecoder.decodeObject(forKey: "sku") as? String ?? ""
        self.size = aDecoder.decodeObject(forKey: "size") as? String ?? ""
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(sku, forKey: "sku")
        aCoder.encode(size, forKey: "size")
    }
    
}

func saveBasket(item: BasketItem) {
    var basketItems = loadBasketItems()
    basketItems?.append(item)
    let placesData = NSKeyedArchiver.archivedData(withRootObject: basketItems)
    UserDefaults.standard.set(placesData, forKey: "basketItems")
}

func loadBasketItems() -> [BasketItem]? {
    guard let placesData = UserDefaults.standard.object(forKey: "basketItems") as? NSData else {
        return []
    }
    guard let placesArray = NSKeyedUnarchiver.unarchiveObject(with: placesData as Data) as? [BasketItem] else {
        return []
    }
    return placesArray
}
