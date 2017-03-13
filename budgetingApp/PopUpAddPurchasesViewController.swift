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

    @IBOutlet weak var minusView: UIButton!
    @IBOutlet weak var plusView: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dollarTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func plusButton(_ sender: Any) {
        SavedValues.saved.totalAmount += Double(dollarTextField.text!)!
        self.user.setValue(SavedValues.saved.totalAmount, forKey: "total")
        dismiss(animated: true, completion: nil)
    }
    @IBAction func minusButton(_ sender: Any) {
        SavedValues.saved.totalAmount -= Double(dollarTextField.text!)!
        SavedValues.saved.costItems?.append(Double(dollarTextField.text!)!)
        SavedValues.saved.nameItems?.append(nameTextField.text!)
        dismiss(animated: true, completion: nil)
    }

}
