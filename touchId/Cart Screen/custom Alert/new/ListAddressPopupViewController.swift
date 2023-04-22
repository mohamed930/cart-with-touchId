//
//  ListAddressPopupViewController.swift
//  touchId
//
//  Created by Mohamed Ali on 22/04/2023.
//

import UIKit

protocol PopupProtocol {
    func Back()
}

class ListAddressPopupViewController: UIViewController {
    
    @IBOutlet weak var backgroundView:UIView!
    @IBOutlet weak var headerView:UIView!
    
    @IBOutlet weak var addressTableView:UITableView!
    
    @IBOutlet weak var ProccessedButton:UIButton!
    
    // MARK: - Properties
    var delegate: PopupProtocol?
    let cornderRadiousValue = 0.125
    let buttonCornerRadious = 0.205

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    private func configureUI() {
        self.view.MakeCornerRadious(value: cornderRadiousValue)
        backgroundView.MakeCornerRadious(value: cornderRadiousValue)
        headerView.MakeRound(value: cornderRadiousValue, v: [.layerMinXMinYCorner,.layerMaxXMinYCorner])
        ProccessedButton.MakeCornerRadious(value: buttonCornerRadious)
    }
    
    @IBAction func canclButtonAction(_ sender: Any) {
        self.delegate?.Back()
    }
    
    @IBAction func processedButtonAction(_ sender: Any) {
    }

}
