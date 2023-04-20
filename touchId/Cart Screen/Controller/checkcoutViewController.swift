//
//  checkcoutViewController.swift
//  touchId
//
//  Created by Mohamed Ali on 20/04/2023.
//

import UIKit

class checkcoutViewController: UIViewController {
    
    @IBOutlet weak var paymentView:UIView!
    @IBOutlet weak var deliveryView:UIView!
    
    @IBOutlet weak var cardRadiou:UIButton!
    @IBOutlet weak var bankRadio:UIButton!
    
    @IBOutlet weak var DoorDeleivery:UIButton!
    @IBOutlet weak var pickupDeleivery:UIButton!
    
    @IBOutlet weak var totalLabel:UILabel!
    
    @IBOutlet weak var processedPaymentButton:UIButton!
    
    let viewCornerRadious = 0.06
    let buttonCornerRadious = 0.1024
    
    var totalValue: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        SetViewUI()
        ShowTotalValueInUI()
    }
    
    func SetViewUI() {
        paymentView.MakeCornerRadious(value: viewCornerRadious)
        deliveryView.MakeCornerRadious(value: viewCornerRadious)
        
        processedPaymentButton.MakeCornerRadious(value: buttonCornerRadious)
    }
    
    func ShowTotalValueInUI() {
        totalLabel.text = "\(totalValue ?? 0)"
    }
    
    @IBAction func BackButton(_ sender:Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func SetRadioButtonAction (_ sender: UIButton) {
        if sender.tag == 1 {
            SetRadioButtonSelectedInUI(buttonName: cardRadiou, sender: sender)
            bankRadio.isSelected = false
        }
        else if sender.tag == 2 {
            SetRadioButtonSelectedInUI(buttonName: bankRadio, sender: sender)
            cardRadiou.isSelected = false
        }
        
        if sender.tag == 3 {
            SetRadioButtonSelectedInUI(buttonName: DoorDeleivery, sender: sender)
            pickupDeleivery.isSelected = false
        }
        else if sender.tag == 4 {
            SetRadioButtonSelectedInUI(buttonName: pickupDeleivery, sender: sender)
            DoorDeleivery.isSelected = false
        }
    }
    
    private func SetRadioButtonSelectedInUI(buttonName: UIButton, sender: UIButton) {
        if sender.isSelected {
            buttonName.isSelected = false
        }
        else {
            buttonName.isSelected = true
        }
    }

}
