//
//  EditViewController.swift
//  budgetingApp
//
//  Created by allen welch on 3/10/17.
//  Copyright © 2017 Allen welch. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    let users = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func eraseAllData(_ sender: Any) {
        SavedValues.saved.totalAmount = 0.0
        SavedValues.saved.spentAmount = 0.0
        SavedValues.saved.haveAmount = 0.0
        SavedValues.saved.catasToatalCOst = [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00]
        //SavedValues.saved.cata = ["Food", "Car", "House", "Pets", "Entertainment", "Bills", "Tax", "Gifts"]
        SavedValues.saved.nameItems.removeAll()
        SavedValues.saved.costItems.removeAll()
        SavedValues.saved.itemsCataNum.removeAll()
        
        self.users.setValue(SavedValues.saved.totalAmount, forKey: "total")
        self.users.setValue(SavedValues.saved.itemsCataNum, forKey: "cataNum")
        self.users.setValue(SavedValues.saved.costItems, forKey: "costItem")
        self.users.setValue(SavedValues.saved.nameItems, forKey: "nameOfItems")
        //spent being weird..
        self.users.setValue(SavedValues.saved.spentAmount, forKey: "spent")
        //..being weird
        self.users.setValue(SavedValues.saved.catasToatalCOst, forKey: "totalofcata")
        users.synchronize()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "dollardollar"{
            let des = segue.destination as! PopUpDollarOnlyViewController
            
            des.preferredContentSize = CGSize(width: 450, height: 300)
        }
       
    }
}
