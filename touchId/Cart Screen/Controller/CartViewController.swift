//
//  CartViewController.swift
//  touchId
//
//  Created by Mohamed Ali on 20/04/2023.
//

import UIKit

class CartViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var productsTableView:UITableView!
    @IBOutlet weak var processedButton:UIButton!
    
    let buttonRadiousValue = 0.125
    let nibFileName    = "productsCell"
    let cellIdentifier = "Cell"
    let cellSperatorHight = 5.0
    var cartArray = Array<cartModel>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ButtonUI()
        regesterNibFile()
        LoadData()
    }
    
    func ButtonUI() {
        processedButton.MakeCornerRadious(value: buttonRadiousValue)
    }
    
    @IBAction func processedButtonAction (_ sender: Any) {
        
    }
    
    func LoadData() {
        var product = cartModel(productId: 1, productImageName: "image 2", productName: "Veggie tomato mix", productPrice: 1900, productCount: 1)
        cartArray.append(product)
        
        product = cartModel(productId: 2, productImageName: "image 3", productName: "Fishwith mix orange", productPrice: 1900, productCount: 1)
        cartArray.append(product)
        
        product = cartModel(productId: 3, productImageName: "image 2 (2)", productName: "Egg and cucmber", productPrice: 1900, productCount: 1)
        cartArray.append(product)
    }
    
    func regesterNibFile() {
        productsTableView.register(UINib(nibName: nibFileName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cartArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else {
            return cellSperatorHight
        }
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: productsCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! productsCell
        
        cell.ConfigureCell(cartArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118.0
    }
    
    

}

