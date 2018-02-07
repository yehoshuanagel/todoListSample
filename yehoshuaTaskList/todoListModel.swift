//
//  todoListModel.swift
//  yehoshuaTaskList
//
//  Created by Yehoshua Nagel on 2/6/18.
//  Copyright © 2018 Yehoshua Nagel. All rights reserved.
//

import Foundation

struct todoListItem {
    let itemName : String
    let itemDate : Date
}

let sharedModel = todoListModel()

protocol todoListDelegate : class {
    func itemAdded(item : todoListItem)
}

class todoListModel {
    weak var delegate : todoListDelegate?
    
    public var items : [todoListItem] = []
    
    public func addItem(withName name : String?, date : Date) {
        let newItem = todoListItem(itemName: name ?? "Unnamed", itemDate: date)
        items.append(newItem)
        self.delegate?.itemAdded(item: newItem)
    }
}
