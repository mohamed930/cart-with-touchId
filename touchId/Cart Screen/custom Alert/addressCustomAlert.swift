//
//  addressCustomAlert.swift
//  touchId
//
//  Created by Mohamed Ali on 21/04/2023.
//

import UIKit

class addressCustomAlert: UIView {
    
//    @IBOutlet weak var parentView:UIView!
    
    @IBOutlet weak var backgroundView:UIView!
    @IBOutlet weak var headerView:UIView!
    
    @IBOutlet weak var addressTableView:UITableView!
    
    @IBOutlet weak var ProccessedButton:UIButton!
    
    // MARK: - Properties
    var delegate: AlertViewDelegate?
    let cornderRadiousValue = 0.125
    let buttonCornerRadious = 0.245
    
    class func instanceFromNib() -> addressCustomAlert {
        let view = UINib(nibName: "addressCustomAlert", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! addressCustomAlert
        view.configureUI()
        return view
    }
    
    private func configureUI() {
        backgroundView.MakeCornerRadious(value: cornderRadiousValue)
        headerView.MakeRound(value: cornderRadiousValue, v: [.layerMinXMinYCorner,.layerMaxXMinYCorner])
        ProccessedButton.MakeCornerRadious(value: buttonCornerRadious)
    }
    
    @IBAction func processedButtonAction(_ sender: Any) {
        print("hello")
    }
    
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        print("we are here!!")
        self.delegate?.removeAlert(sender: self)
    }
}


// MARK: - Delegate
protocol AlertViewDelegate {
    func removeAlert(sender: addressCustomAlert)
//    func handleData(name: String, isAllowed: Bool)
}
