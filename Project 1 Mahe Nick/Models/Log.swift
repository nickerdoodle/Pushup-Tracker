//
//  Log.swift
//  Project 1 Mahe Nick
//
//  Created by Nick Mahe on 10/2/19.
//  Copyright © 2019 Nick Mahe. All rights reserved.
//

import Foundation

class Log {
    //Properties
    
    var date: String = ""
    var pushups: Int = 0
    
    

    
    init(date: String, pushups: Int){
        self.date = date
        self.pushups = pushups
    }
    
    
    //Testing for any
    var propertyList: [Any]{
        return [date, pushups]
    }
    
    init?(propertyList: [Any]){
        //2 refers to the two attributes
        if propertyList.count != 2 {
            return nil
        }
        
        guard let date = propertyList[0] as? String,
            let pushups = propertyList[1] as? Int
            else{
            return nil
        }
        
        self.date = date
        self.pushups = pushups
        
    }
}
