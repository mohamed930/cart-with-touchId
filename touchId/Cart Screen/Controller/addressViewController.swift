//
//  addressViewController.swift
//  touchId
//
//  Created by Mohamed Ali on 21/04/2023.
//

import UIKit

class addressViewController: UIViewController, PopupProtocol {
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
    var deliverystatus: Bool?
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
        
        guard let deliverystatus = deliverystatus else {
            return
        }

        if deliverystatus {
            doorDeliveryRadioButton.isSelected = true
        }
        else {
            pickupRadioButton.isSelected = true
        }
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
        let AboutPop: ListAddressPopupViewController = ListAddressPopupViewController(nibName: "ListAddressPopupViewController", bundle: nil)
        self.view.alpha = 1.0
        AboutPop.delegate = self
        self.presentpopupViewController(popupViewController: AboutPop, animationType: .Fade, completion: {() -> Void in })
    }
    
    func Back() {
        self.dismissPopupViewController(animationType: .Fade)
    }
    
    func SendDataToMain(addressmodel: addressModel) {
        self.dismissPopupViewController(animationType: .Fade)
        
        orderAddressLabel.text = addressmodel.orderAddress
        orderNameownerLabel.text = addressmodel.orderAddressName
        orderTelephoneLabel.text = addressmodel.ownerTelephone
    }
    
    @IBAction func processedToPaymentButtonAction(_ sender: Any) {
        
    }

}
