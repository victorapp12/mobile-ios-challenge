//
//  CatalogInterfaceController.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Palhares on 27/04/2019.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import WatchKit
import Foundation

protocol CatalogInterfaceControllerProtocol: class {
    
}

class CatalogInterfaceController: WKInterfaceController {

    var interactor: CatalogInteractor?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    //Setup
    private func setup() {
        let interactor = CatalogInteractor()
        self.interactor = interactor
        let presenter = CatalogPresenter()
        presenter.controller = self
        interactor.presenter = presenter
    }
    
}

extension CatalogInterfaceController: CatalogInterfaceControllerProtocol {
    
}
