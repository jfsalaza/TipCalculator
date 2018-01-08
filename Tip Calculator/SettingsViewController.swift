//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Juan Salazar on 12/28/17.
//  Copyright © 2017 Juan Salazar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var ThemeSegment: UISegmentedControl!
    @IBOutlet weak var TipController: UISegmentedControl!
    @IBOutlet weak var PercentageLabel: UILabel!
    @IBOutlet weak var ThemeLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"

        // Do any additional setup after loading the view.
        TipController.selectedSegmentIndex = defaults.integer(forKey: "myIndex")
        ThemeSegment.selectedSegmentIndex = defaults.integer(forKey: "myTheme")
        
        let themeChoice = defaults.integer(forKey: "myTheme")
        
        if(themeChoice == 1){
            DarkTheme()
        }else{
            LightTheme()
        }
    }

    func DarkTheme(){
        self.view.backgroundColor = UIColor(red:0 , green:0 , blue:0 , alpha:1.0)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.PercentageLabel.textColor = UIColor(red:1 , green:1 , blue:1 , alpha:1.0)
        self.ThemeLabel.textColor = UIColor(red:1 , green:1 , blue:1 , alpha:1.0)
    }
    
    func LightTheme(){
        self.view.backgroundColor = UIColor(red:255 , green:255 , blue:255 , alpha:1.0)
        self.PercentageLabel.textColor = UIColor(red:0 , green:0 , blue:0 , alpha:1.0)
        self.ThemeLabel.textColor = UIColor(red:0 , green:0 , blue:0 , alpha:1.0)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.default
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ThemeChange(_ sender: Any) {
        let segmentChoice = [0,1]
        let themeChoice = segmentChoice[ThemeSegment.selectedSegmentIndex]
        
        if(themeChoice == 0){
            LightTheme()
        }
        
        if(themeChoice == 1){
            DarkTheme()
        }
        
        defaults.set(themeChoice, forKey: "myTheme")
        defaults.synchronize()
        
    }
    
    @IBAction func SegmentedTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let percentage = tipPercentages[TipController.selectedSegmentIndex]
        defaults.set(percentage, forKey: "myDouble")
        defaults.set(TipController.selectedSegmentIndex, forKey: "myIndex") 
        defaults.synchronize()
    
    }
    
    
}
