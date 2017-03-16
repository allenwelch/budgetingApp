//
//  PopUpPurchasesViewController.swift
//  budgetingApp
//
//  Created by allen welch on 3/10/17.
//  Copyright © 2017 Allen welch. All rights reserved.
//

import UIKit

class PopUpPurchasesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var name : String?
    var arrayOfNames = [String]()
    var arrayOfPrices = [Double]()
    var numbertosave = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print("GATE 1 \(name!)")
        for ii in 0...(SavedValues.saved.cata.count - 1) {
            if SavedValues.saved.cata[ii] == name!{
                numbertosave = ii
            }
        }
        
        print("number to save it \(numbertosave)")
        
        //SavedValues.saved.nameItems
        if SavedValues.saved.itemsCataNum.count != 0{
            for i in 0...(SavedValues.saved.itemsCataNum.count - 1) {
                if SavedValues.saved.itemsCataNum[i] == numbertosave{
                    arrayOfNames.append(SavedValues.saved.nameItems[i])
                    arrayOfPrices.append(SavedValues.saved.costItems[i])
                    print(arrayOfPrices)
                    print(arrayOfNames)
                }
            }
        }
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nom") as! cellForNom
        cell.nameOfObject.text = arrayOfNames[indexPath.row]
        cell.priceOfObject.text = "$\(arrayOfPrices[indexPath.row])"
        cell.imageForThings.image = UIImage(named: name!)
        
        return cell
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

class cellForNom : UITableViewCell{
    @IBOutlet weak var imageForThings: UIImageView!
    @IBOutlet weak var priceOfObject: UILabel!
    @IBOutlet weak var nameOfObject: UILabel!
    
}
