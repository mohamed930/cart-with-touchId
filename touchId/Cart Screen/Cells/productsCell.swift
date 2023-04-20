//
//  productsCell.swift
//  touchId
//
//  Created by Mohamed Ali on 20/04/2023.
//

import UIKit

class productsCell: UITableViewCell {
    
    @IBOutlet weak var productImageView:UIImageView!
    @IBOutlet weak var productNameLabel:UILabel!
    @IBOutlet weak var productPriceLabel:UILabel!
    
    @IBOutlet weak var countView:UIView!
    @IBOutlet weak var plusButton:UIButton!
    @IBOutlet weak var minusButton:UIButton!
    @IBOutlet weak var productCount:UILabel!
    
    let cornderRadiousValue = 0.5
    let viewRadiousValue = 0.2
    let cellRadiousValue = 0.08

    override func awakeFromNib() {
        super.awakeFromNib()
        
        ConfigureUI()
    }
    
    private func ConfigureUI() {
        productImageView.MakeCornerRadious(value: cornderRadiousValue)
        countView.MakeCornerRadious(value: viewRadiousValue)
        
        self.MakeCornerRadious(value: cellRadiousValue)
    }
    
    func ConfigureCell(_ productmodel: cartModel) {
        productImageView.image = UIImage(named: productmodel.productImageName)
        productNameLabel.text = productmodel.productName
        productPriceLabel.text = "#\(productmodel.productPrice)"
        productCount.text = "\(productmodel.productCount)"
    }
}
