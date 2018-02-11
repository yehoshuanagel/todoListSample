//
//  TodoViewController.swift
//  yehoshuaTaskList
//
//  Created by Yehoshua Nagel on 2/6/18.
//  Copyright © 2018 Yehoshua Nagel. All rights reserved.
//

import UIKit

class TodoViewController: UITableViewController, TodoListDelegate {
    let list = TodoListModel()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list.delegate = self
        dateFormatter.dateFormat = "'Due 'MMM dd' at 'h:mm a"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let addItemViewController = segue.destination as? AddItemViewController {
            addItemViewController.list = list
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoListCell")
        let item = list.items[indexPath.row]
        
        cell?.textLabel?.text = item.itemName
        cell?.detailTextLabel?.text = dateFormatter.string(from: item.itemDate)
        cell?.detailTextLabel?.textColor = item.itemDate.isInPast() ? #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        return cell ?? UITableViewCell()
    }
    
    func itemAdded(item: TodoListItem) {
        let indexPath = IndexPath(row: tableView.numberOfRows(inSection: 0), section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        let secondsToGo = item.itemDate.timeIntervalSinceNow
        if !(item.itemDate.isInPast()) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + secondsToGo, execute: {
                self.tableView.cellForRow(at: indexPath)?.detailTextLabel?.textColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            })
        }
    }
}

