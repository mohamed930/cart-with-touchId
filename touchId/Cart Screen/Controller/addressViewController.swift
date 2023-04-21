//
//  addressViewController.swift
//  touchId
//
//  Created by Mohamed Ali on 21/04/2023.
//

import UIKit

class addressViewController: UIViewController, AlertViewDelegate {
    
    
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
    var alertViewConstraint: NSLayoutConstraint!
    
    private lazy var alertView: addressCustomAlert = {
        let view = addressCustomAlert.instanceFromNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        SetupUI()
        ShowTheTotalPriceInUI()
    }
    
    func SetupUI() {
        processedToPaymentButton.MakeCornerRadious(value: buttonCornerRadious)
        
        addressView.MakeCornerRadious(value: viewCornerRadious)
        deliveryView.MakeCornerRadious(value: viewCornerRadious)
        
        self.alertViewConstraint = NSLayoutConstraint(item: self.alertView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
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
        self.view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ])
        
        alertView.isUserInteractionEnabled = true
        self.view.addSubview(alertView)
        NSLayoutConstraint.activate([
            alertView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            alertView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            alertViewConstraint
        ])
    }
    
    func removeAlert(sender: addressCustomAlert) {
        sender.removeFromSuperview()
        self.backgroundView.removeFromSuperview()
    }
    
    @IBAction func processedToPaymentButtonAction(_ sender: Any) {
        
    }

}
