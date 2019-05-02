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
    func display(_ products: [Product])
    func showLoading()
    func hideLoading()
    func displayError(_ message: MessageError)
}

class CatalogInterfaceController: WKInterfaceController {
    
    @IBOutlet var table: WKInterfaceTable!
    
    var interactor: CatalogInteractor?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        self.setup()
        self.setupUI()
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
        
        interactor.getProducts()
    }
    
    //Setup UI
    private func setupUI() {
        self.setTitle("AMARO")
    }
    
}

extension CatalogInterfaceController: CatalogInterfaceControllerProtocol {
    
    func display(_ products: [Product]) {
        table.setNumberOfRows(products.count, withRowType: "ProductRow")
        for(index, product) in products.enumerated() {
            if let productRow = table.rowController(at: index) as? ProductRow {
                productRow.setupRow(with: product)
            }
        }
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func displayError(_ message: MessageError) {
        
    }
    
}
