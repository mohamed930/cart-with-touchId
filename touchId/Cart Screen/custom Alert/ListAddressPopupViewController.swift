//
//  ListAddressPopupViewController.swift
//  touchId
//
//  Created by Mohamed Ali on 22/04/2023.
//

import UIKit

protocol PopupProtocol {
    func Back()
    func SendDataToMain(addressmodel: addressModel)
}

class ListAddressPopupViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var backgroundView:UIView!
    @IBOutlet weak var headerView:UIView!
    
    @IBOutlet weak var addressTableView:UITableView!
    
    @IBOutlet weak var ProccessedButton:UIButton!
    
    // MARK: - Properties
    var delegate: PopupProtocol?
    let cornderRadiousValue = 0.125
    let buttonCornerRadious = 0.205
    let cellIdentifier = "Cell"
    let nibFileName = "addressCell"
    var addressArray = Array<addressModel>()
    var pickedAddressmodel: addressModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        LoadData()
        ConfigureCell()
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
        guard let pickedAddressmodel = pickedAddressmodel else {
            print("Please picked address")
            return
        }

        self.delegate?.SendDataToMain(addressmodel: pickedAddressmodel)
    }
    
    func LoadData() {
        var addressmodel = addressModel(orderAddressName: "Mohamed Ali", orderAddress: "masaken Elmoalmean Emart Qasem Entance B Floor one behind resturant wadde3 street 25 cairo Egypt", ownerTelephone: "+201273455681",selected: true)
        addressArray.append(addressmodel)
        
        addressmodel = addressModel(orderAddressName: "Zyad", orderAddress: "portsaid, portfouad", ownerTelephone: "+201271594453",selected: false)
        addressArray.append(addressmodel)
        
        addressmodel = addressModel(orderAddressName: "Hager", orderAddress: "Cairo, Madent Naser", ownerTelephone: "+201271596324",selected: false)
        addressArray.append(addressmodel)
        
        pickedAddressmodel = addressArray[0]
        
    }
    
    func ConfigureCell() {
        addressTableView.register(UINib(nibName: nibFileName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        addressTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: addressCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! addressCell
        
        cell.ConfigureCell(addressArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(addressArray[indexPath.row])
        for i in 0..<addressArray.count {
            if i == indexPath.row {
                addressArray[indexPath.row].selected = !addressArray[indexPath.row].selected
            }
            else {
                addressArray[i].selected = false
            }
        }
        
        if addressArray[indexPath.row].selected {
            pickedAddressmodel = addressArray[indexPath.row]
        }
        else {
            pickedAddressmodel = nil
        }
        
        addressTableView.reloadData()
    }

}
