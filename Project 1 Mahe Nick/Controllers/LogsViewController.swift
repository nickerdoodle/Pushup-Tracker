//
//  LogsViewController.swift
//  Project 1 Mahe Nick
//
//  Created by Nick Mahe on 10/2/19.
//  Copyright © 2019 Nick Mahe. All rights reserved.
//

import UIKit

class LogsViewController:UITableViewController{

    //Properties
    
    private struct Storyboard{

        static let topicCellIdentifier = "TopicCell"
        //static let totalCellIdentifier = "TotalCell"
    }
    
    private struct Key{
        static let logs = "Logs"
    }
    
    var model: [Log] = []

    //Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if indexPath.row < model.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.topicCellIdentifier, for: indexPath)

            cell.textLabel?.text = "\(model[indexPath.row].date)"
            cell.detailTextLabel?.text = "Pushups: \(model[indexPath.row].pushups)"

            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.topicCellIdentifier, for: indexPath)
            
            cell.textLabel?.text = "Total Pushups: \(LogsDeck.totalPushups)"

             return cell
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LogsDeck.sharedInstance.logs.count + 1
    }
    
    //Table view delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadModel()
        
    }
 
    //Helpers
    
    private func loadModel() {
        if let storedModel = UserDefaults.standard.array(forKey: Key.logs) as? [[Any]] {
            
            model.removeAll()
            LogsDeck.totalPushups = 0
            
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

