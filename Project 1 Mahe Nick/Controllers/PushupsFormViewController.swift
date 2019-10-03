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
    private var pushupDate: String? = nil
    private var year: Int? = nil
    private var month: Int? = nil
    private var day: Int? = nil
    
    
    // Outlets
    
    @IBOutlet weak var pushupCount: UITextField!
    @IBOutlet weak var pushupDatePicker: UIDatePicker!
    
    @IBAction func pushupNumber(_ sender: UITextField) {
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
    
    // Actions
    
    @IBAction func pushupDate(_ sender: UIDatePicker) {
        year = sender.calendar.component(Calendar.Component.year, from: sender.date)
        month = sender.calendar.component(Calendar.Component.month, from: sender.date)
        day = sender.calendar.component(Calendar.Component.day, from: sender.date)
    }
    
    @IBAction func pushupSubmit(_ sender: UIButton) {
        LogsDeck.sharedInstance.logs.append(Log(date: "12/20/2018", pushups: pushupsCompleted))
        print(pushupsCompleted, pushupDate, year, month, day)
    }
    
    
    
    
}
