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
    func addProductToBasket(sku: String, name: String, size: String)
    var products: [Product] { get set }
}

class CatalogInterfaceController: WKInterfaceController {
    
    @IBOutlet var table: WKInterfaceTable!
    
    var interactor: CatalogInteractor?
    var products: [Product] = []
    var applyFilter: Bool = true
    var displayedProducts: [Product] = []
    
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
        self.addMenuItem(with: .info, title: "On sale products", action: #selector(addSaleFilter))
        self.addMenuItem(with: .add, title: "Basket", action: #selector(goToBasket))
    }
    
    @objc func addSaleFilter() {
        if self.applyFilter {
            self.applyFilter = false
            interactor?.filter(products: self.products)
        } else {
            self.applyFilter = true
            self.display(self.products)
        }
    }
    
    @objc func goToBasket() {
        self.pushController(withName: "BasketView", context: nil)
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        if let availableSizes = self.displayedProducts[rowIndex].sizes,
            availableSizes.count > 0 {
            self.presentController(withName: "DetailView", context: displayedProducts[rowIndex])
        }
    }
    
}

extension CatalogInterfaceController: CatalogInterfaceControllerProtocol {
    
    func display(_ products: [Product]) {
        self.displayedProducts = products
        table.setNumberOfRows(products.count, withRowType: "ProductRow")
        for(index, product) in products.enumerated() {
            if let productRow = table.rowController(at: index) as? ProductRow {
                productRow.setupRow(with: product)
            }
        }
    }
    
    func addProductToBasket(sku: String, name: String, size: String) {
        let productToAdd = ["sku": sku, "name": name, "size": size]
        self.pushController(withName: "BasketView", context: productToAdd)
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func displayError(_ message: MessageError) {
        
    }
    
}
