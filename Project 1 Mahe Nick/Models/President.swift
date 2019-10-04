//
//  President.swift
//  Project 1 Mahe Nick
//
//  Created by Nick Mahe on 10/3/19.
//  Copyright © 2019 Nick Mahe. All rights reserved.
//

import Foundation

class President{
    var givenNames = ""
    var lastNames = ""
    var yearElected = 0
    
    var name: String{
        "\(givenNames) \(lastNames)"
    }
    
    var propertyList: [Any]{
        return [givenNames, lastNames, yearElected]
    }
    
    
    init(givenNames: String, lastNames: String, yearElected: Int){
        self.givenNames = givenNames
        self.lastNames = lastNames
        self.yearElected = yearElected
    }
    
    
    init?(propertyList: [Any]){
        //3 refers to the three attributes
        if propertyList.count != 3 {
            return nil
        }
        
        guard let givenNames = propertyList[0] as? String,
            let lastNames = propertyList[1] as? String,
            let yearElected = propertyList[2] as? Int else{
            return nil
        }
        
        self.givenNames = givenNames
        self.lastNames = lastNames
        self.yearElected = yearElected
    }
}

