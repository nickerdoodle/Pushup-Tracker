//
//  LogsDeck.swift
//  Project 1 Mahe Nick
//
//  Created by Nick Mahe on 10/2/19.
//  Copyright © 2019 Nick Mahe. All rights reserved.
//

import Foundation

class LogsDeck{
    //var logs: [Log] = [Log(date:"12/12/2018", pushups:20),Log(date:"12/14/2018",pushups:30)]
    var logs: [Log] = []
    static let sharedInstance = LogsDeck()
    static var totalPushups = 0
    private init(){
        update()
    }
    
    private func update(){
        let logset = logs
    }
    
    
}
