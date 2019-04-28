//
//  BuildConfiguration.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Palhares on 27/04/2019.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation

enum EnvsConfiguration {
    case dev
    case pro
    
    var baseURL: URL {
        switch self {
        case .dev:
            return URL(string: "http://www.mocky.io/v2/59b6a65a0f0000e90471257d")!
        case .pro:
            return URL(string: "http://www.mocky.io/v2/59b6a65a0f0000e90471257d")!
        }
    }
    
}

class BuildConfiguration {
    
    let buildConfiguration = EnvsConfiguration.pro
    
    static let shared: BuildConfiguration = {
        let instance = BuildConfiguration()
        return instance
    }()
    
    static var baseURL: URL {
        return shared.buildConfiguration.baseURL
    }
    
}
