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
    
    let buttonRadiousValue = 0.1024
    let nibFileName    = "productsCell"
    let cellIdentifier = "Cell"
    let cellSperatorHight = 15.0
    var cartArray = Array<cartModel>()
    var empty: Bool = false

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
        var total = 0
        for i in cartArray {
            total += i.productPrice
        }
        
        let story = UIStoryboard(name: "CartView", bundle: nil)
        let nextVc = story.instantiateViewController(withIdentifier: "checkcoutViewController") as! checkcoutViewController
        nextVc.totalValue = total
        nextVc.modalPresentationStyle = .fullScreen
        self.present(nextVc, animated: true)
        
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
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favImg = imgModel(imgName: "love", width: 22, hight: 20)
        let favouriteAction = AddAction(imgData: favImg) { _ in
            print("favourite pressed!!")
        }
        
        let trashImg = imgModel(imgName: "trash", width: 20, hight: 24)
        let trashAction = AddAction(imgData: trashImg) { _ in
            print("trash pressed!!")
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [trashAction,favouriteAction])
        return configuration
    }
    
    private func AddAction(imgData: imgModel, completion: @escaping (Bool) -> ()) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: nil) { (action, view, completionHandler)  in
            completion(true)
            completionHandler(true)
        }

        action.backgroundColor = UIColor(named: "Page Background")
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        button.layer.cornerRadius = 35
        button.backgroundColor = .red
        button.tintColor = .white
        button.setImage(UIImage(named: imgData.imgName)?.resize(to: CGSize(width: imgData.width, height: imgData.hight)), for: .normal)

        button.center = CGPoint(x: view.frame.size.width - button.frame.size.width/2 - 10, y: view.frame.size.height/2)
        action.image = imageFromView(button)
        
        return action
    }
    
    // Helper function to create an image from a view
    private func imageFromView(_ view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
        view.layer.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
        return image
    }

}

