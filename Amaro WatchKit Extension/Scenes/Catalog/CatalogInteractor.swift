//
//  CatalogInteractor.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Palhares on 27/04/2019.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation

protocol CatalogInteractorProtocol {

}

class CatalogInteractor: CatalogInteractorProtocol {
    
    var presenter: CatalogPresenterProtocol?
    var worker: CatalogWorker = CatalogWorker()
    
    
}
