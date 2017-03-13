//
//  GraphViewController.swift
//  budgetingApp
//
//  Created by allen welch on 3/10/17.
//  Copyright © 2017 Allen welch. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {

    @IBOutlet weak var rightButtonView: UIButton!
    @IBOutlet weak var leftButtonView: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func rightButton(_ sender: Any) {
        print("right")
    }

    @IBAction func leftButton(_ sender: Any) {
        print("left")
    }
}
