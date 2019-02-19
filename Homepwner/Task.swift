//
//  Task.swift
//  Homepwner
//
//  Created by Paul Baker on 2/19/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//

import Foundation

class Task {
    var description: String
    var dateCreated: Date
    
    init(description: String, dateCreated: Date = Date()) {
        self.description = description
        self.dateCreated = dateCreated
    }
}
