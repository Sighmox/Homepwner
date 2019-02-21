//
//  TaskTableViewController.swift
//  Homepwner
//
//  Created by Paul Baker on 2/19/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//

import UIKit


class TaskTableViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskModel.count()
    }
    
    
    
    // This determines the amount of rows and what cell for what row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = taskModel.getTask(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = task?.description
        let dateString = Formatting.dateFormatter.string(from: (task?.dateCreated)!)
        cell.detailTextLabel?.text = "Created at \(dateString)"
        return cell
    }
    // This controls the segue from the tableView to the Detail view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let detailView = segue.destination as! DetailViewController
            let rowsSelected = tableView.indexPathsForSelectedRows
            let firstRow = rowsSelected?[0]
            let task = taskModel.getTask(at: (firstRow?.row)!)
            detailView.task = task
        }
    }
    // TaskList connection to the table controller
    var taskModel: TaskList!
    // Button that adds the tasks
    @IBAction func addNewTask(_ sender: Any) {
        let inputAlert = UIAlertController(title: "Enter Task", message: "Describe what you need to do", preferredStyle: .alert)
        inputAlert.addTextField(configurationHandler: nil)
        inputAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: {(action: UIAlertAction) in
            if let description = inputAlert.textFields?[0].text {
                // Validates there is a task entered into the textfield before adding
                if description.count < 1 {
                    print("Please enter a task!")
                } else {
                let task = Task(description: description)
                let index = self.taskModel.add(task)
                let indexPath = IndexPath(row: index, section: 0)
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
            }
        }
        ))
    
        inputAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(inputAlert, animated: true)
    }
    // This removes an item from the list
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.taskModel.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
}
