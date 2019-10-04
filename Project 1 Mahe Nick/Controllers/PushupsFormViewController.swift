//
//  PushupsFormViewController.swift
//  Project 1 Mahe Nick
//
//  Created by Nick Mahe on 10/2/19.
//  Copyright © 2019 Nick Mahe. All rights reserved.
//

import UIKit

class PushupsFormViewController:UIViewController{
    
    // Properties
    private var pushupsCompleted: Int = 5
    private var pushupDate: String = ""
    private var year: Int = 0
    private var month: Int = 0
    private var day: Int = 0
    
    private struct Key{
        static let logs = "Logs"
    }
    var model: [Log] = []
    
    // Outlets
    
    @IBOutlet weak var pushupCount: UITextField!
    @IBOutlet weak var pushupDatePicker: UIDatePicker!
    
    
    
    // Actions
    
    // Will store the value of pushups completed
    /*@IBAction func pushupNumber(_ sender: UITextField) {
        if let userInput = sender.text{
            if let text = Int(userInput){
                pushupsCompleted = text
                //pushupsCompleted = pushupCount.text
            }
            else{
                
            }
        }
        else{
            
        }
    }*/
    
    @IBAction func pushupNumberChanged(_ sender: UITextField) {
        if let userInput = sender.text{
            if let text = Int(userInput){
                pushupsCompleted = text
                //pushupsCompleted = pushupCount.text
            }
            else{
                
            }
        }
        else{
            
        }
    }
    
    // Store the value of date pushups were completed
    @IBAction func pushupDate(_ sender: UIDatePicker) {
        year = sender.calendar.component(Calendar.Component.year, from: sender.date)
        month = sender.calendar.component(Calendar.Component.month, from: sender.date)
        day = sender.calendar.component(Calendar.Component.day, from: sender.date)
        pushupDate = "\(month)/\(day)/\(year)"
    }
    
    
    // Story the entry into the logs
    @IBAction func pushupSubmit(_ sender: UIButton) {
        LogsDeck.sharedInstance.logs.append(Log(date: pushupDate, pushups: pushupsCompleted))
        model = LogsDeck.sharedInstance.logs
        var dict:[String:Int] = [:]
        for entry in LogsDeck.sharedInstance.logs{
            dict[entry.date] = entry.pushups
        }
        let propertyListModel = model.map { $0.propertyList }
        
        UserDefaults.standard.set(propertyListModel, forKey: "Logs")
        //UserDefaults.standard.set(LogsDeck.sharedInstance.logs, forKey: "Logs")
        //UserDefaults.standard.set(dict, forKey:"Logs")
        //print(pushupsCompleted, pushupDate, year, month, day)
    }
    
    
    
   /*
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeModel()
    }
    private func initializeModel(){
        model.removeAll()
        
        model.append(Log(date: "12/10/2019", pushups: 10))
    }
 */
    
    
    
    
}
