//
//  ViewController.swift
//  budgetingApp
//
//  Created by allen welch on 3/10/17.
//  Copyright © 2017 Allen welch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let users = UserDefaults.standard
    @IBOutlet weak var totalAmountLBL: UILabel!
    @IBOutlet weak var spentAmountLBL: UILabel!
    @IBOutlet weak var nowHaveLBL: UILabel!
    var total = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if users.value(forKey: "total") != nil {
            total = users.value(forKey: "total") as! Double
            SavedValues.saved.totalAmount = total
        }
        
        totalAmountLBL.text = "Total Amount: $\(SavedValues.saved.totalAmount)"
        spentAmountLBL.text = "Spent Amount: $\(SavedValues.saved.spentAmount)"
        nowHaveLBL.text = "Now Have: $\(SavedValues.saved.haveAmount)"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Plus"{
            let des = segue.destination
            
            des.preferredContentSize = CGSize(width: 450, height: 300)
        }
        if segue.identifier == "Minus"{
            let des = segue.destination
            
            des.preferredContentSize = CGSize(width: 450, height: 300)
        }
    }

}

