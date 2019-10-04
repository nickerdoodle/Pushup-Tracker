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
    
    var model: [Log] = []

//Helpers for dates

/*let dateFormatter = DateFormatter()

dateFormatter.dateFormat = "dd/MM/yyyy"*/

    //Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //print(UserDefaults.standard.array(forKey: "Logs") as? [Any] ?? [Log]())
        //LogsDeck.sharedInstance.logs = []
        //LogsDeck.sharedInstance.logs = UserDefaults.standard.array(forKey:"Logs") as? [Log] ?? [Log]()
        //var test = UserDefaults.standard.object(forKey:"Logs") as? [Log] ?? [Log]()
        //print(test)
       /* if LogsDeck.sharedInstance.logs.count != 0{*/
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.topicCellIdentifier, for: indexPath)
           
            cell.textLabel?.text = "\(model[indexPath.row].date) \t\t\t Pushups: \(model[indexPath.row].pushups)"
            /*return cell
        }
        let cell = UITableViewCell()
        cell.textLabel?.text = "Go to the tracker to create your first pushup entry!"
        */
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UserDefaults.standard.removeObject(forKey: "Logs")
        initializeModel()
        loadModel()
    }
    private func initializeModel(){
        //model.removeAll()
        
        //model.append(Log(date: "12/10/2019", pushups: 10))
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
            LogsDeck.sharedInstance.logs = model
        }
    }
    
}

