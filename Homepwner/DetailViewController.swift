//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Paul Baker on 2/19/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var task: Task!
    
    
    @IBOutlet weak var taskDescription: UILabel!
    @IBOutlet weak var taskDateCreated: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        taskDescription.text = task.description
        let dateString = Formatting.dateFormatter.string(from: (task?.dateCreated)!)
        taskDateCreated.text = "Created at \(dateString)"
    }
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
