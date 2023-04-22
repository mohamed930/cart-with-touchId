//
//  addressCell.swift
//  touchId
//
//  Created by Mohamed Ali on 22/04/2023.
//

import UIKit

class addressCell: UITableViewCell {
    
    @IBOutlet weak var addressTitleLabel:UILabel!
    @IBOutlet weak var addressTelephoneLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func ConfigureCell(_ addressmodel: addressModel) {
        addressTitleLabel.text = "Delivery to \(addressmodel.orderAddressName)"
        addressTelephoneLabel.text = "\(addressmodel.ownerTelephone)"
        
        accessoryType = addressmodel.selected ? .checkmark : .none
    }
}
