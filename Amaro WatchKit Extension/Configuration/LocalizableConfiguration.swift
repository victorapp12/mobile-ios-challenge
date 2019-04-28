//
//  LocalizableConfiguration.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Palhares on 28/04/2019.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import Foundation

public func amaroLocalizableString(_ key: String) -> String {
    let result = Bundle.main.localizedString(forKey: key, value: nil, table: "Amaro")
    return result
}
