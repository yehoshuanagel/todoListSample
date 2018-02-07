//
//  TodoListModel.swift
//  yehoshuaTaskList
//
//  Created by Yehoshua Nagel on 2/6/18.
//  Copyright © 2018 Yehoshua Nagel. All rights reserved.
//

import Foundation

struct TodoListItem {
    let itemName : String
    let itemDate : Date
}

protocol TodoListDelegate : class {
    func itemAdded(item : TodoListItem)
}

class TodoListModel {
    weak var delegate : TodoListDelegate?
    
    public var items : [TodoListItem] = []
    
    public func addItem(withName name : String?, date : Date) {
        let newItem = TodoListItem(itemName: name ?? "Unnamed", itemDate: date)
        items.append(newItem)
        self.delegate?.itemAdded(item: newItem)
    }
}
