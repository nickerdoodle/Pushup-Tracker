//
//  MasterViewController.swift
//  Project 1 Mahe Nick
//
//  Created by Nick Mahe on 10/3/19.
//  Copyright © 2019 Nick Mahe. All rights reserved.
//
/*
import UIKit

class MasterViewController: UITableViewController{
    private struct President{
        static let cellIdentifier = "TopicCell"
    }
    
    private struct Key{
        static let keyCellIdentifier = "somecellidentifier"
    }
    
    var model: [President]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeModel()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cellIdentifier, for:indexPath)
        cell.textLabel.text = model[indexPath.row].name
        
        return cell
    }
    
    private func initializeModel(){
        model.removeAll()
        
        model.append(President(givenNames: "George", lastNames: "Washington", yearElected: 1789))
    }
    
    private func saveModel(){
        UserDefaults.standard.set(model.map({ $0.propertyList }), forKey: Key.president)
    }
    
    private func loadModel(){
        if let storedModel = UserDefaults.standard.array(forKey: Key.president) as? [[Any]]{
            model.removeAll()
            
            for propertyListPresident in storedModel{
                if let president = President(propertyList: propertyListPresident){
                    model.append(president)
                }
            }
        }
        
    }
    
}
*/
