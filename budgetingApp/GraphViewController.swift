//
//  GraphViewController.swift
//  budgetingApp
//
//  Created by allen welch on 3/10/17.
//  Copyright © 2017 Allen welch. All rights reserved.
//

import UIKit


class GraphViewController: UIViewController, PopUpDollarOnlyViewControllerDelegate {
    
    var users = UserDefaults.standard
    @IBOutlet weak var rightButtonView: UIButton!
    @IBOutlet weak var leftButtonView: UIButton!
    @IBOutlet weak var graphViewLbl: UILabel!
    
    @IBOutlet weak var goalLBL: UILabel!
    //graphStuff start...
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var bar1: UIView!
    
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var bar2: UIView!
    
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var bar3: UIView!
    
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var bar4: UIView!
    
    
    //...graphStuff end
    
    var goal = 0.0
    var first = 0
    var second = 3
    var savedvalue = SavedValues.saved.cata
    var ival = 0
    var num = 0
    var nameLbl = ""
    
    
    @IBOutlet weak var haveLBL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var largestSpent = 0.0
        var cataNum = 0
        
        
        
        if users.value(forKey: "goal") != nil {
            goal = users.value(forKey: "goal") as! Double
            SavedValues.saved.goal = goal
        }
        users.synchronize()
        
        if SavedValues.saved.goal == SavedValues.saved.haveAmount {
            goalLBL.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        }else if SavedValues.saved.goal < SavedValues.saved.haveAmount{
            goalLBL.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        }else{
            goalLBL.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        goalLBL.text = "GOAL: $\(SavedValues.saved.goal)"
        
        
        
        var lblArray : [UILabel] = [lbl1, lbl2, lbl3, lbl4]
        var barArray = [bar1, bar2, bar3, bar4]
        
        
        
        if SavedValues.saved.costItems.count != 0 {
            for i in 0...(SavedValues.saved.costItems.count - 1){
                if largestSpent < SavedValues.saved.costItems[i] {
                    largestSpent = SavedValues.saved.costItems[i]
                    cataNum = SavedValues.saved.itemsCataNum[i]
                }
                
            }
            
            largestSpent = 0
            for iii in 0...(SavedValues.saved.costItems.count - 1){
                if cataNum == SavedValues.saved.itemsCataNum[iii]{
                    largestSpent += SavedValues.saved.costItems[iii]
                }
            }
            
            for i in first...second{
                
                if i >= savedvalue.count{
                    print("out of range")
                }else{
                    lblArray[i].text = "\(SavedValues.saved.cata[i])"
                    let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapped(_:)))
                    lblArray[i].isUserInteractionEnabled = true
                    lblArray[i].addGestureRecognizer(tap)
                    
                    
                    
                    //cata/bigprice = percentage
                    
                    //percentage * max = bar height
                    
                    //max y -460
                    
                    //7.5 / 15 = .50
                    // .50 * -460 = -230
                    let numOfTotalCOst = (SavedValues.saved.catasToatalCOst[i])
                    
                    
                    
                    barArray[i]?.frame = CGRect(x: (barArray[i]?.frame.origin.x)!, y: (barArray[i]?.frame.origin.y)! + 200  , width: (barArray[i]?.frame.size.width)!, height: CGFloat((numOfTotalCOst / largestSpent) * -420))
                    //((83.0, 259.0, 64.0, 200.0))
                    //print(barArray[i]?.frame)
                    //print("___________________")
                    barArray[i]?.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
                    //print("the isval == \(i) and the saved is \(SavedValues.saved.itemsCataNum)")
                    
                    
                }
                
            }
        }else{
            for i in first...second{
                
                if i >= savedvalue.count{
                    print("out of range")
                }else{
                    lblArray[i].text = "\(SavedValues.saved.cata[i])"
                    
                }
            }
        }
        
        print("END...")
        
        graphViewLbl.text = "Spent"
        haveLBL.text = "Have: $\(SavedValues.saved.haveAmount)"
        //print(SavedValues.saved.cata)
        //print("largest number is \(largestSpent)")
        print(SavedValues.saved.catasToatalCOst)
        //print(SavedValues.saved.nameItems)
        //print(SavedValues.saved.costItems)
        //print(SavedValues.saved.itemsCataNum)
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    //RIGHT BUTTON
    @IBAction func rightButton(_ sender: Any) {
        var lblArray : [UILabel] = [lbl1, lbl2, lbl3, lbl4]
        var barArray = [bar1, bar2, bar3, bar4]
        var largestSpent = 0.0
        var cataNum = 0
        
        for iii in 0...3{
            barArray[iii]?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        if first > savedvalue.count{
            print("no more cata")
        }else{
            
            first += 4
            second += 4
            if first >= savedvalue.count{
                
                first -= 4
                second -= 4
            }
        }
        if SavedValues.saved.costItems.count != 0 {
            for i in 0...(SavedValues.saved.costItems.count - 1){
                if largestSpent < SavedValues.saved.costItems[i] {
                    largestSpent = SavedValues.saved.costItems[i]
                    cataNum = SavedValues.saved.itemsCataNum[i]
                }
                
            }
            largestSpent = 0
            for iii in 0...(SavedValues.saved.costItems.count - 1){
                if cataNum == SavedValues.saved.itemsCataNum[iii]{
                    largestSpent += SavedValues.saved.costItems[iii]
                }
            }
            for i in first...second{
                
                
                if i >= savedvalue.count{
                    print("out of range")
                    if num > 0{
                        lblArray[ival].text = ""
                        barArray[ival]?.isHidden = true
                    }
                    
                }else{
                    
                    lblArray[ival].text = "\(SavedValues.saved.cata[i])"
                    
                    let numOfTotalCOst = (SavedValues.saved.catasToatalCOst[i])
                    print(numOfTotalCOst)
                    //((83.0, 259.0, 64.0, 200.0))
                    barArray[ival]?.frame = CGRect(x: (barArray[ival]?.frame.origin.x)!, y: 222.0 , width: 64.0, height: 200.0)
                    
                    
                    print(ival)
                    barArray[ival]?.frame = CGRect(x: (barArray[ival]?.frame.origin.x)!, y: (barArray[ival]?.frame.origin.y)! + 200  , width: (barArray[ival]?.frame.size.width)!, height: CGFloat((numOfTotalCOst / largestSpent) * -420))
                    barArray[ival]?.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
                    
                    
                    num += 1
                    if num == 3{
                        num = 0
                    }
                }
                
                if ival == 3{
                    
                    ival = 0
                }else{
                    ival += 1
                }
                
            }
        }
        //print("END.....")
        print("right")
    }
    
    
    
    //LEFT BUTTON
    @IBAction func leftButton(_ sender: Any) {
        var lblArray : [UILabel] = [lbl1, lbl2, lbl3, lbl4]
        var barArray = [bar1, bar2, bar3, bar4]
        var largestSpent = 0.0
        var cataNum = 0
        var barnumy : CGFloat?
        
        for iii in 0...3{
            barArray[iii]?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        if first == 0{
            print("no more cata")
        }else{
            
            first -= 4
            second -= 4
            if first > savedvalue.count{
                first += 4
                second += 4
            }
        }
        if SavedValues.saved.costItems.count != 0 {
            for i in 0...(SavedValues.saved.costItems.count - 1){
                if largestSpent < SavedValues.saved.costItems[i] {
                    largestSpent = SavedValues.saved.costItems[i]
                    cataNum = SavedValues.saved.itemsCataNum[i]
                }
                
            }
            largestSpent = 0
            for iii in 0...(SavedValues.saved.costItems.count - 1){
                if cataNum == SavedValues.saved.itemsCataNum[iii]{
                    largestSpent += SavedValues.saved.costItems[iii]
                }
            }
            for i in first...second{
                
                if i >= savedvalue.count{
                    print("out of range")
                    if num > 0{
                        lblArray[ival].text = ""
                        barArray[ival]?.isHidden = true
                    }
                }else{
                    lblArray[ival].text = "\(SavedValues.saved.cata[i])"
                    barArray[ival]?.isHidden = false
                    
                    let numOfTotalCOst = (SavedValues.saved.catasToatalCOst[i])
                    
                    barArray[ival]?.frame = CGRect(x: (barArray[ival]?.frame.origin.x)!, y: 222.0 , width: 64.0, height: 200.0)
                    
                    barnumy = (barArray[ival]?.frame.origin.y)! + 200
                    
                    barArray[ival]?.frame = CGRect(x: (barArray[ival]?.frame.origin.x)!, y: barnumy!  , width: (barArray[ival]?.frame.size.width)!, height: CGFloat((numOfTotalCOst / largestSpent) * -420))
                    barArray[ival]?.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
                    
                    num += 1
                    if num == 3{
                        num = 0
                    }
                }
                if ival == 3{
                    ival = 0
                }else{
                    ival += 1
                }
                
            }
        }
        print("left")
    }
    
    
    func tapped(_ sender : UITapGestureRecognizer){
        //print("works \n")
        let labelText = sender.view as! UILabel
        let name = labelText.text!
        nameLbl = name
        performSegue(withIdentifier: "popP", sender: name)
        print(labelText.text!)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popP"{
            print("GATE 3 \(nameLbl)")
            let des = segue.destination as! PopUpPurchasesViewController
            des.name = nameLbl
            
        }
    }
    func gettingGoal(amount: Double) {
        goalLBL.text = "Goal: $\(amount)"
        print(amount)
    }
    
    
}
