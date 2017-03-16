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
    var total = 0.00
    var spent = 0.00
    var costOfItem = [Double]()
    var nameOfItems = [String]()
    var cataitems = [Int]()
    var checkTime : Timer?
    var totalcata = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //cataNum
        if users.value(forKey: "cataNum") != nil {
            cataitems = users.value(forKey: "cataNum") as! [Int]
            SavedValues.saved.itemsCataNum = cataitems
        }
        
        if users.value(forKey: "total") != nil {
            total = users.value(forKey: "total") as! Double
            SavedValues.saved.totalAmount = total
        }
        if users.value(forKey: "spent") != nil {
            spent = users.value(forKey: "spent") as! Double
            SavedValues.saved.spentAmount = spent
        }
        if users.value(forKey: "costItem") != nil {
            costOfItem = users.value(forKey: "costItem") as! [Double]
            SavedValues.saved.costItems = costOfItem
        }
        if users.value(forKey: "nameOfItems") != nil {
            nameOfItems = users.value(forKey: "nameOfItems") as! [String]
            SavedValues.saved.nameItems = nameOfItems
        }
        //totalofcata
        if users.value(forKey: "totalofcata") != nil {
            totalcata = users.value(forKey: "totalofcata") as! [Double]
            SavedValues.saved.catasToatalCOst = totalcata
        }
        checkTime = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(totalAmount), userInfo: nil, repeats: true)
        SavedValues.saved.haveAmount = SavedValues.saved.totalAmount - SavedValues.saved.spentAmount
        totalAmountLBL.text = "Total Amount: $\(SavedValues.saved.totalAmount)"
        spentAmountLBL.text = "Spent Amount: $\(SavedValues.saved.spentAmount)"
        nowHaveLBL.text = "Now Have: $\(SavedValues.saved.haveAmount)"
        users.synchronize()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "Plus"{
            let des = segue.destination as! PopUpAddPurchasesViewController
            des.popUpVal = 1
            des.preferredContentSize = CGSize(width: 450, height: 300)
        }
        if segue.identifier == "Minus"{
            let des = segue.destination as! PopUpAddPurchasesViewController
            des.popUpVal = 2
            des.preferredContentSize = CGSize(width: 450, height: 300)
        }
    }
    
    func totalAmount() {
        //print(amount)
        totalAmountLBL.text = "Total Amount: $\(SavedValues.saved.totalAmount)"
        spentAmountLBL.text = "Spent Amount: $\(SavedValues.saved.spentAmount)"
        SavedValues.saved.haveAmount = SavedValues.saved.totalAmount - SavedValues.saved.spentAmount
        nowHaveLBL.text = "Now Have: $\(SavedValues.saved.haveAmount)"
        users.synchronize()
        
    }

}

