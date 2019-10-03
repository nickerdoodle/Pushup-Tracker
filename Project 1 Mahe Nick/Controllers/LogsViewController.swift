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
    static let showQuoteSegueIdentifier = "ShowQuote"
    static let topicCellIdentifier = "TopicCell"
    static let totalCellIdentifier = "TotalCell"
}

//Helpers for dates

/*let dateFormatter = DateFormatter()

dateFormatter.dateFormat = "dd/MM/yyyy"*/

    //Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.topicCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = "\(LogsDeck.sharedInstance.logs[indexPath.row].date) \t\t\t Pushups: \(LogsDeck.sharedInstance.logs[indexPath.row].pushups)"
        
        
        return cell
    }
    
    
    // Add this to update total pushups
    /*let totalPushupsCell =
    tableView.dequeueReusableCell(withIdentifier: Storyboard.totalCellIdentifier, for: indexPath)*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LogsDeck.sharedInstance.logs.count
    }
    
    //Table view delegate
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //selectedTopic = LogsDeck.sharedInstance.logs[indexPath.row]
        performSegue(withIdentifier: Storyboard.showQuoteSegueIdentifier, sender: self)
    }

    
}

