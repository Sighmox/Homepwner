//
//  TaskList.swift
//  Homepwner
//
//  Created by Paul Baker on 2/19/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//
// This class connects the data to the table when a new item is created in the
// array it is added to the table
import Foundation

class TaskList {
    
    var tasks = [Task]()
    
    func add(_ task: Task) -> Int {
        tasks.append(task)
        return tasks.endIndex-1
        
    }
    
    func getTask(at index: Int) -> Task? {
        if tasks.indices.contains(index) {
            return tasks[index]
        }
        return nil
        
    }
    
    func count() -> Int {
        return tasks.count
    }
}
