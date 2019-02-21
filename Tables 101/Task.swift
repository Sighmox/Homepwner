//
//  Task.swift
//  Homepwner
//
//  Created by Paul Baker on 2/19/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//
// This class is called whenever a new task object needs to be created
import Foundation

class Task {
    var description: String
    var dateCreated: Date
    
    init(description: String, dateCreated: Date = Date()) {
        self.description = description
        self.dateCreated = dateCreated
    }
}
