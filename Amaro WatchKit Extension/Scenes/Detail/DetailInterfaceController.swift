//
//  DetailInterfaceController.swift
//  Amaro WatchKit Extension
//
//  Created by Victor Perdomo on 02/05/19.
//  Copyright © 2019 Victor Palhares. All rights reserved.
//

import WatchKit
import Foundation

class DetailInterfaceController: WKInterfaceController {

    @IBOutlet var picker: WKInterfacePicker!
    @IBOutlet var productNameLabel: WKInterfaceLabel!
    @IBOutlet var availableSizesLabel: WKInterfaceLabel!
    @IBOutlet var buyButton: WKInterfaceButton!
    
    var sizes: [Size] = []
    var selectedSizeIndex: Int = 0
    var productName: String = ""
    
    var catalogController: CatalogInterfaceController = CatalogInterfaceController()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    
        // Configure interface objects here.
        if let contextReceived = context {
            if let productReceived = contextReceived as? Product {
                setupInfo(product: productReceived)
            }
        }
        setupUI()
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
        //Sizes
        let attrAvailableSizes = NSMutableAttributedString()
        attrAvailableSizes.availableSizesTitleAttrString(string: amaroLocalizableString("sizes") + ":" , fontSize: CGFloat(integerLiteral: 8))
        availableSizesLabel.setAttributedText(attrAvailableSizes)
        //Buy Button
        let attrBuyButtonTitle = NSMutableAttributedString()
        attrBuyButtonTitle.availableBuyButtonTitleAttrString(string: amaroLocalizableString("buy"), fontSize: CGFloat(integerLiteral: 14))
        buyButton.setAttributedTitle(attrBuyButtonTitle)
        buyButton.setBackgroundColor(UIColor.fromHex("#1cc286"))
    }
    
    private func setupInfo(product: Product) {
        if let productName = product.name {
            setup(name: productName)
        }
        if let productSizes = product.sizes {
            self.sizes = productSizes
            setup(sizes: productSizes)
        }
    }
    
    private func setup(name: String) {
        let attrName = NSMutableAttributedString()
        attrName.productDetailTitleAttrString(string: name, fontSize: CGFloat(integerLiteral: 14))
        productNameLabel.setAttributedText(attrName)
        self.productName = name
    }
    
    private func setup(sizes: [Size]) {
        let pickerItems: [WKPickerItem] = sizes.map {
            var sizeName = $0.size ?? ""
            if let available = $0.available, available == false {
                sizeName += " - " + amaroLocalizableString("unavailable")
            }
            let pickerItem = WKPickerItem()
            pickerItem.title = sizeName
            pickerItem.caption = $0.sku
            return pickerItem
        }
        picker.setItems(pickerItems)
        picker.focus()
    }

    @IBAction func pickerSelectedItemChanged(value: Int) {
        self.selectedSizeIndex = value
        let currentSize = self.sizes[self.selectedSizeIndex]
        if let available = currentSize.available {
            self.buyButton.setEnabled(available)
        }
    }
    
    @IBAction func addProductToBasket() {
        let currentSize = self.sizes[self.selectedSizeIndex]
        if let available = currentSize.available, available == false {
            //Product unavailable
            return
        }
        editBasket(size: currentSize)
    }
    
    private func editBasket(size: Size) {
        self.dismiss()
        let productToAdd = BasketItem(name: self.productName, sku: size.sku ?? "", size: size.size ?? "")
        saveBasket(item: productToAdd)
    }
    
}
