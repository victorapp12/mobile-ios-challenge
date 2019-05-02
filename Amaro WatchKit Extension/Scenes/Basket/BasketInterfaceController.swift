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

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        self.setupUI()
    }
    
    override func didAppear() {
        
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
        self.setTitle("Basket")
    }

}
