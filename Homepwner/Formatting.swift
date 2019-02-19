//
//  Formatting.swift
//  Homepwner
//
//  Created by Paul Baker on 2/19/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//
// This class formats the date 
import Foundation

class Formatting {
    
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .short
        return df
    
    }()
}
