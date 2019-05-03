//
//  BasketInterfaceController.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Perdomo on 02/05/19.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import WatchKit
import Foundation

class BasketInterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    @IBOutlet weak var emptyBasketGroup: WKInterfaceGroup! {
        didSet {
            self.emptyBasketGroup.setHidden(true)
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        self.setupUI()
    }
    
    override func didAppear() {
        self.setup()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    private func setupUI() {
        self.setTitle(amaroLocalizableString("basketMenu"))
        self.addMenuItem(with: .decline, title: amaroLocalizableString("clean"), action: #selector(cleanBasket))
    }
    
    @objc func cleanBasket() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "basketItems")
        self.setup()
    }
    
    private func setup() {
        if let basketItems = loadBasketItems() {
            if basketItems.count == 0 {
                self.emptyBasketGroup.setHidden(false)
                self.table.setHidden(true)
                return
            }
            var cleanItems: [BasketItem] = []
            for product in basketItems {
                if !cleanItems.contains(product) {
                    cleanItems.append(product)
                }
            }
            self.display(cleanItems)
        }
    }
    
    func display(_ basketItems: [BasketItem]) {
        table.setNumberOfRows(basketItems.count, withRowType: "BasketRow")
        for(index, product) in basketItems.enumerated() {
            if let basketRow = table.rowController(at: index) as? BasketRow {
                basketRow.setupRow(product: product)
            }
        }
    }

}
