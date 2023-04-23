//
//  finishedViewController.swift
//  touchId
//
//  Created by Mohamed Ali on 23/04/2023.
//

import UIKit

class finishedViewController: UIViewController {
    
    @IBOutlet weak var BackToHomeButton:UIButton!
    
    let buttonCornerRadious = 0.1024

    override func viewDidLoad() {
        super.viewDidLoad()

        ConfigueUI()
    }
    
    func ConfigueUI() {
        BackToHomeButton.MakeCornerRadious(value: buttonCornerRadious)
    }
    
    @IBAction func returnCartPageViewController() {
        let story = UIStoryboard(name: "CartView", bundle: nil)
        let nextVc = story.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        nextVc.empty = true
        nextVc.modalPresentationStyle = .fullScreen
        self.present(nextVc, animated: true)
    }
}
