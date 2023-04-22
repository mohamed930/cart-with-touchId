//
//  addressModel.swift
//  touchId
//
//  Created by Mohamed Ali on 21/04/2023.
//

import Foundation

struct addressModel {
    var orderAddressName: String
    var orderAddress: String
    var ownerTelephone: String
    var selected: Bool
    
    init(orderAddressName: String, orderAddress:String, ownerTelephone: String) {
        self.orderAddressName = orderAddressName
        self.orderAddress = orderAddress
        self.ownerTelephone = ownerTelephone
        self.selected = false
    }
    
    init(orderAddressName: String, orderAddress:String, ownerTelephone: String,selected: Bool) {
        self.orderAddressName = orderAddressName
        self.orderAddress = orderAddress
        self.ownerTelephone = ownerTelephone
        self.selected = selected
    }
    
}
