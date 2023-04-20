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
    
    @objc func incrementproudct (_ sender: UIButton) {
        MakeUIAction(tag: sender.tag, operation: "+")
    }
    
    @objc func decrementproduct (_ sender: UIButton) {
        MakeUIAction(tag: sender.tag, operation: "-")
    }
    
    private func MakeUIAction(tag: Int,operation: Character) {
        // update the product price.
        let productprice = cartArray[tag].productPrice / cartArray[tag].productCount
        
        if operation == "+" {
            // update the UI with one product added
            cartArray[tag].productCount += 1
            // update the new product price to UI
            cartArray[tag].productPrice += productprice
        }
        else {
            // update the prouct count in UI if the product is one do no thing.
            if cartArray[tag].productCount == 1 {
                cartArray[tag].productCount = 1
            }
            else {
                cartArray[tag].productCount -= 1
            }
            
            // update the product price in UI.
            cartArray[tag].productPrice = productprice * cartArray[tag].productCount
            
        }
        
        productsTableView.reloadData()
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
        
        cell.ConfigureCell(cartArray[indexPath.section])
        
        cell.plusButton.tag = indexPath.section
        cell.plusButton.addTarget(self,
        action: #selector(incrementproudct),
        for: .touchUpInside)
        
        cell.minusButton.tag = indexPath.section
        cell.minusButton.addTarget(self,
        action: #selector(decrementproduct),
        for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118.0
    }
    
    

}

