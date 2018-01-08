//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Juan Salazar on 12/18/17.
//  Copyright © 2017 Juan Salazar. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalSLabel: UILabel!
    @IBOutlet weak var tipSLabel: UILabel!
    @IBOutlet weak var NavigationItem: UINavigationItem!
    @IBOutlet weak var PartyMembers: UILabel!
    @IBOutlet weak var PartyMembersNumbers: UITextField!
    
    @IBOutlet weak var PartyLabel: UILabel!
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        print("view did disappear")
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.billField.becomeFirstResponder()
        
        let themeChoice = defaults.integer(forKey: "myTheme")
        
        if(themeChoice == 1){
           DarkTheme()
        }else{
            LightTheme()
        }
        
        
        let percentage = defaults.double(forKey: "myDouble")
        let bill = Double(billField.text!)  ?? 0
        let tip = bill * percentage
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func DarkTheme(){
        self.view.backgroundColor = UIColor(red:0 , green:0 , blue:0 , alpha:1.0)
        self.tipLabel.textColor = UIColor(red:1 , green:121.0 , blue:251.0 , alpha:1.0)
        self.totalLabel.textColor = UIColor(red:1 , green:121 , blue:251 , alpha:1.0)
        self.tipSLabel.textColor = UIColor(red:1 , green:121 , blue:251 , alpha:1.0)
        self.totalSLabel.textColor = UIColor(red:1 , green:121 , blue:251 , alpha:1.0)
        self.PartyLabel.textColor = UIColor(red:1 , green:121 , blue:251 , alpha:1.0)
        self.PartyMembers.textColor = UIColor(red:1 , green:121 , blue:251 , alpha:1.0)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
    }
    
    func LightTheme(){
        self.view.backgroundColor = UIColor(red:255 , green:255 , blue:255 , alpha:1.0)
        self.NavigationItem.titleView?.backgroundColor = UIColor(red:255 , green:255 , blue:255 , alpha:1.0)
        self.tipLabel.textColor = UIColor(red:0 , green:0 , blue:0 , alpha:1.0)
        self.totalLabel.textColor = UIColor(red:0 , green:0 , blue:0 , alpha:1.0)
        self.tipSLabel.textColor = UIColor(red:0 , green:0 , blue:0 , alpha:1.0)
        self.totalSLabel.textColor = UIColor(red:0 , green:0 , blue:0 , alpha:1.0)
        self.PartyLabel.textColor = UIColor(red:0 , green:0 , blue:0 , alpha:1.0)
        self.PartyMembers.textColor = UIColor(red:0 , green:0 , blue:0 , alpha:1.0)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.default
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnTap(_ sender: AnyObject) {
        print("Hello")
        view.endEditing(true)
    }
    
    @IBAction func CalculateTip(_ sender: Any) {
        let percentage = defaults.double(forKey: "myDouble")
        
        let bill = Double(billField.text!)  ?? 0
        let tip = bill * percentage
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        defaults.set(total, forKey: "myTotal")
    }
    
    @IBAction func stepperFunc(_ sender: UIStepper) {
        PartyLabel.text = String(format: "%.0f",sender.value)
        var total = defaults.double(forKey: "myTotal")
        
        let numberParty = Int(sender.value)
        
        total = total/Double(numberParty)
        
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

