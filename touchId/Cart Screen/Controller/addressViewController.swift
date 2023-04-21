//
//  addressViewController.swift
//  touchId
//
//  Created by Mohamed Ali on 21/04/2023.
//

import UIKit

class addressViewController: UIViewController {
    
    @IBOutlet weak var addressView:UIView!
    @IBOutlet weak var orderNameownerLabel:UILabel!
    @IBOutlet weak var orderAddressLabel:UILabel!
    @IBOutlet weak var orderTelephoneLabel:UILabel!
    
    @IBOutlet weak var deliveryView:UIView!
    @IBOutlet weak var doorDeliveryRadioButton:UIButton!
    @IBOutlet weak var pickupRadioButton:UIButton!
    
    @IBOutlet weak var totalPriceLabel:UILabel!
    
    @IBOutlet weak var processedToPaymentButton:UIButton!
    
    let buttonCornerRadious = 0.1024
    let viewCornerRadious = 0.06
    var totalPrice: Int?
    var orderAddressDetais: addressModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        SetupUI()
        ShowTheTotalPriceInUI()
    }
    
    func SetupUI() {
        processedToPaymentButton.MakeCornerRadious(value: buttonCornerRadious)
        
        addressView.MakeCornerRadious(value: viewCornerRadious)
        deliveryView.MakeCornerRadious(value: viewCornerRadious)
    }
    
    func ShowTheTotalPriceInUI() {
        totalPriceLabel.text = "\(totalPrice ?? 0)"
        
        guard let orderAddressDetais = orderAddressDetais else {
            return
        }
        
        orderNameownerLabel.text = orderAddressDetais.orderAddressName
        orderAddressLabel.text   = orderAddressDetais.orderAddress
        orderTelephoneLabel.text = orderAddressDetais.ownerTelephone

    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func RadioButtonActions(_ sender: UIButton) {
        if sender.tag == 1 {
            doorDeliveryRadioButton.SetRadioButtonSelectedInUI()
            pickupRadioButton.isSelected = false
        }
        else if sender.tag == 2 {
            pickupRadioButton.SetRadioButtonSelectedInUI()
            doorDeliveryRadioButton.isSelected = false
        }
    }
    
    @IBAction func changeAddressButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func processedToPaymentButtonAction(_ sender: Any) {
        
    }

}
