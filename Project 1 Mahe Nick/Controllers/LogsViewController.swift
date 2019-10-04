//
//  LogsViewController.swift
//  Project 1 Mahe Nick
//
//  Created by Nick Mahe on 10/2/19.
//  Copyright © 2019 Nick Mahe. All rights reserved.
//

import UIKit

class LogsViewController:UITableViewController{

    private struct Storyboard{
        //probably don't need line below either
        static let showQuoteSegueIdentifier = "ShowQuote"
        static let topicCellIdentifier = "TopicCell"
        //static let totalCellIdentifier = "TotalCell"
    }
    
    var model: [Log] = []

//Helpers for dates

/*let dateFormatter = DateFormatter()

dateFormatter.dateFormat = "dd/MM/yyyy"*/

    //Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if indexPath.row < model.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.topicCellIdentifier, for: indexPath)
           
            cell.textLabel?.text = "\(model[indexPath.row].date) \t\t\t Pushups: \(model[indexPath.row].pushups)"

            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.topicCellIdentifier, for: indexPath)
            
            cell.textLabel?.text = "Total Pushups: \(LogsDeck.totalPushups)"

             return cell
        }
    }
    
    
    
    
    
    
    // Add this to update total pushups
    /*let totalPushupsCell =
    tableView.dequeueReusableCell(withIdentifier: Storyboard.totalCellIdentifier, for: indexPath)*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LogsDeck.sharedInstance.logs.count + 1
    }
    
    //Table view delegate
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: Storyboard.showQuoteSegueIdentifier, sender: self)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadModel()
        
    }
    
    private func loadModel() {
        if let storedModel = UserDefaults.standard.array(forKey: "Logs") as? [[Any]] {
            
            model.removeAll()
            print(storedModel)
            for propertyListPresident in storedModel {
                if let log = Log(propertyList: propertyListPresident) {
                    model.append(log)
                }
            }
            for entry in model{
                LogsDeck.totalPushups += entry.pushups
            }
            LogsDeck.sharedInstance.logs = model
        }
    }
    
}

