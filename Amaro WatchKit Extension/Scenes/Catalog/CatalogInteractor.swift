//
//  CatalogInteractor.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Palhares on 27/04/2019.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation

protocol CatalogInteractorProtocol {
    func getProducts()
    func filter(products: [Product])
}

class CatalogInteractor: CatalogInteractorProtocol {
    
    var presenter: CatalogPresenterProtocol?
    var worker: CatalogWorker = CatalogWorker()
    
    func getProducts() {
        let url = BuildConfiguration.baseURL
        worker.requestProducts(with: url, completion: { ProductsMain in
            self.presenter?.present(ProductsMain)
        })
    }
    
    func filter(products: [Product]) {
        if products.count == 0 {
            return
        }
        presenter?.present(onSale: products)
    }
    
}
