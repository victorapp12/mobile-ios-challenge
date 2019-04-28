//
//  CatalogPresenter.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Palhares on 27/04/2019.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation
import Alamofire

protocol CatalogPresenterProtocol {
    func present(_ productsMain: DataResponse<ProductsMain>)
}

class CatalogPresenter: CatalogPresenterProtocol {
    
    weak var controller: CatalogInterfaceControllerProtocol?
    
    func present(_ productsMain: DataResponse<ProductsMain>) {
        switch productsMain.result {
        case .success(_):
            guard (productsMain.response?.statusCode) != nil else {
                //Something Wrong
                return
            }
            if let productsResponse = productsMain.result.value {
                if productsResponse.productsMain?.count == 0 {
                    //No Results
                    return
                }
                if let products = productsResponse.productsMain {
                    controller?.display(products)
                    return
                }
            }
            //Something Wrong
        case .failure(let encodingError):
            if let err = encodingError as? URLError, err.code == .notConnectedToInternet {
                //No Connection
                return
            }
            //Something Wrong
            break
        }
    }
    
}
