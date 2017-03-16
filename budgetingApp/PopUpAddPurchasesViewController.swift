//
//  PopUpAddPurchasesViewController.swift
//  budgetingApp
//
//  Created by allen welch on 3/10/17.
//  Copyright © 2017 Allen welch. All rights reserved.
//

import UIKit




class PopUpAddPurchasesViewController: UIViewController {
    let user = UserDefaults.standard

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var minusView: UIButton!
    @IBOutlet weak var plusView: UIButton!
    var popUpVal = 0
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dollarTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if popUpVal == 1 {
            minusView.isHidden = true
            nameTextField.isHidden = true
            nameLbl.isHidden = true
        }else if popUpVal == 2{
            plusView.isHidden = true
            
            
            
        }
     
    }
    @IBAction func plusButton(_ sender: Any) {
        if (dollarTextField.text?.isEmpty)! == false && Double(dollarTextField.text!) != nil{
                SavedValues.saved.totalAmount += Double(dollarTextField.text!)!
                self.user.setValue(SavedValues.saved.totalAmount, forKey: "total")
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func minusButton(_ sender: Any) {
        if (dollarTextField.text?.isEmpty)! || (nameTextField.text?.isEmpty)!{
            dismiss(animated: true, completion: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let des = segue.destination as! CatagoryViewController
        des.preferredContentSize = CGSize(width: 763, height: 300)


        if segue.identifier == "cata" {
            if (dollarTextField.text?.isEmpty)! || (nameTextField.text?.isEmpty)!{
                dismiss(animated: true, completion: nil)
            }else{
                if Double(dollarTextField.text!) != nil{
                    des.spent = Double(dollarTextField.text!)!
                    des.name = nameTextField.text!
                    des.spawningViewController = self
                }else{
                    dismiss(animated: true, completion: nil)
                }
            }
            
        }
        
    }
}
