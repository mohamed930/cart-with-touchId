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
    var deliverystatus = false

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
    
    @IBAction func processedToAddressButtonAction(_ sender: Any) {
        let story = UIStoryboard(name: "CartView", bundle: nil)
        let nextVc = story.instantiateViewController(withIdentifier: "addressViewController") as! addressViewController
        nextVc.totalPrice = totalValue
        let orderAddressDetails = addressModel(orderAddressName: "Mohamed Ali", orderAddress: "masaken Elmoalmean Emart Qasem Entance B Floor one behind resturant wadde3 street 25 cairo Egypt", ownerTelephone: "+201273455681")
        nextVc.orderAddressDetais = orderAddressDetails
        nextVc.deliverystatus = deliverystatus
        nextVc.modalPresentationStyle = .fullScreen
        present(nextVc, animated: true)
    }
    
    @IBAction func SetRadioButtonAction (_ sender: UIButton) {
        if sender.tag == 1 {
            cardRadiou.SetRadioButtonSelectedInUI()
            bankRadio.isSelected = false
        }
        else if sender.tag == 2 {
            bankRadio.SetRadioButtonSelectedInUI()
            cardRadiou.isSelected = false
        }
        
        if sender.tag == 3 {
            DoorDeleivery.SetRadioButtonSelectedInUI()
            pickupDeleivery.isSelected = false
            deliverystatus = true
        }
        else if sender.tag == 4 {
            pickupDeleivery.SetRadioButtonSelectedInUI()
            DoorDeleivery.isSelected = false
            deliverystatus = false
        }
    }

}
