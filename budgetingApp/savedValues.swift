//
//  savedValues.swift
//  budgetingApp
//
//  Created by allen welch on 3/10/17.
//  Copyright © 2017 Allen welch. All rights reserved.
//

import Foundation

class SavedValues{
    static var saved = SavedValues()
    var totalAmount : Double = 0.0
    var spentAmount : Double = 0.0
    var haveAmount : Double = 0.0
    var cata : [String] = ["Food", "Car", "House", "Pets", "Entertainment", "Bills", "Tax", "Gifts"]
    var nameItems : [String]?
    var costItems : [Double]?
    
}
