//
//  PopUpDollarOnlyViewController.swift
//  budgetingApp
//
//  Created by allen welch on 3/13/17.
//  Copyright © 2017 Allen welch. All rights reserved.
//

import UIKit
protocol PopUpDollarOnlyViewControllerDelegate {
    func gettingGoal(amount : Double) -> Void
}

class PopUpDollarOnlyViewController: UIViewController {
    var spawningViewController : UIViewController?
    let user = UserDefaults.standard
    var delegate : PopUpDollarOnlyViewControllerDelegate?
    
    
    @IBOutlet weak var dollarTextFe: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func plusButton(_ sender: Any) {
        if (dollarTextFe.text?.isEmpty)! {
         dismiss(animated: true, completion: nil)
        }else{
            if Double(dollarTextFe.text!) != nil {
               SavedValues.saved.goal = Double(dollarTextFe.text!)!
                self.user.setValue(SavedValues.saved.goal, forKey: "goal")
                user.synchronize()
                delegate?.gettingGoal(amount: Double(dollarTextFe.text!)!)
            }else{
                dismiss(animated: true, completion: nil)
            }
            
        }
        
        dismiss(animated: true) {
            self.spawningViewController?.dismiss(animated: true, completion: nil)
        }
        
    }

}
