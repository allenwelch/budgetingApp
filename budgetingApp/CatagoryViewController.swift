//
//  CatagoryViewController.swift
//  budgetingApp
//
//  Created by allen welch on 3/10/17.
//  Copyright © 2017 Allen welch. All rights reserved.
//

import UIKit

class CatagoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var user = UserDefaults.standard
    var spent : Double?
    var name : String?
    var spawningViewController : UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(SavedValues.saved.nameItems)
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SavedValues.saved.cata.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainTable") as! TableCellCata
        
       cell.cataLbl.text = SavedValues.saved.cata[indexPath.row]
        cell.cataImage.image = UIImage(named: "\(SavedValues.saved.cata[indexPath.row])")
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SavedValues.saved.spentAmount += spent!
        SavedValues.saved.costItems.append(spent!)
        SavedValues.saved.nameItems.append(name!)
        SavedValues.saved.itemsCataNum.append(indexPath.row)
        SavedValues.saved.catasToatalCOst[indexPath.row] += spent!
        self.user.setValue(SavedValues.saved.itemsCataNum, forKey: "cataNum")
        self.user.setValue(SavedValues.saved.costItems, forKey: "costItem")
        self.user.setValue(SavedValues.saved.nameItems, forKey: "nameOfItems")
        self.user.setValue(SavedValues.saved.spentAmount, forKey: "spent")
        self.user.setValue(SavedValues.saved.catasToatalCOst, forKey: "totalofcata")
        user.synchronize()
//        dismiss(animated: true, completion: nil)
        dismiss(animated: true) {
            self.spawningViewController?.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    
    
    
    
}
class TableCellCata : UITableViewCell{
    @IBOutlet weak var cataImage: UIImageView!
    @IBOutlet weak var cataLbl: UILabel!
    
}
