//
//  CatalogWorker.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Palhares on 27/04/2019.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

typealias responseProductsHandler = (DataResponse<ProductsMain>) -> Void

protocol CatalogWorkerProtocol {
    
    func requestProducts(with url: URL, completion: @escaping(responseProductsHandler))
    
}

class CatalogWorker: CatalogWorkerProtocol {
    
    func requestProducts(with url: URL, completion: @escaping(responseProductsHandler)) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject(completionHandler: completion)
    }
    
}
