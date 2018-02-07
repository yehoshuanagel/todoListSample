//
//  TodoViewController.swift
//  yehoshuaTaskList
//
//  Created by Yehoshua Nagel on 2/6/18.
//  Copyright © 2018 Yehoshua Nagel. All rights reserved.
//

import UIKit

class TodoViewController: UITableViewController, todoListDelegate {
    let list = sharedModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list.delegate = self
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoListCell")
        let item = list.items[indexPath.row]
        cell?.textLabel?.text = item.itemName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "'Due 'MMM dd' at 'h:mm a"
        cell?.detailTextLabel?.text = dateFormatter.string(from: item.itemDate)
        
        cell?.detailTextLabel?.textColor = (item.itemDate < Date()) ? #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return cell ?? UITableViewCell()
    }
    
    func itemAdded(item: todoListItem) {
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: tableView.numberOfRows(inSection: 0), section: 0)], with: .automatic)
        tableView.endUpdates()
    }
}

