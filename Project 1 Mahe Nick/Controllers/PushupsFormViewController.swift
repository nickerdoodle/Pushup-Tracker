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
    private var pushupsCompleted: Int = 0
    private var pushupDate: String = ""
    private var year: Int = 0
    private var month: Int = 0
    private var day: Int = 0
    private var pushupsValid: Bool = false
    
    private struct Key{
        static let logs = "Logs"
    }
    var model: [Log] = []
    
    // Outlets
    
    @IBOutlet weak var pushupCount: UITextField!
    @IBOutlet weak var pushupDatePicker: UIDatePicker!
    
    // Actions
    
    // Will store the value of pushups completed

    @IBAction func pushupNumberChanged(_ sender: UITextField) {
        
        if let userInput = sender.text{
            if let text = Int(userInput){
                if text < 0 {
                    pushupsValid = false
                }
                else{
                    pushupsCompleted = text
                    pushupsValid = true
                }
                
            }
            else{
                pushupsValid = false
            }
        }
        else{
            
        }
    }
    
    // Store the value of the date the pushups were completed
    @IBAction func pushupDate(_ sender: UIDatePicker) {
        year = sender.calendar.component(Calendar.Component.year, from: sender.date)
        month = sender.calendar.component(Calendar.Component.month, from: sender.date)
        day = sender.calendar.component(Calendar.Component.day, from: sender.date)
        pushupDate = "\(month)/\(day)/\(year)"
    }
    
    
    // Story the entry into the logs
    @IBAction func pushupSubmit(_ sender: UIButton) {
        LogsDeck.totalPushups = 0
        
        if pushupsValid {
            LogsDeck.sharedInstance.logs.append(Log(date: pushupDate, pushups: pushupsCompleted))
        }
        
        model = LogsDeck.sharedInstance.logs
        /*for entry in model{
            LogsDeck.totalPushups += entry.pushups
        }*/
        
        let propertyListModel = model.map { $0.propertyList }
        
        UserDefaults.standard.set(propertyListModel, forKey: "Logs")
        
        
    }
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        pushupsValid = false
    }
    
    
    
    
    
}
