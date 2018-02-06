//
//  todoListModel.swift
//  yehoshuaTaskList
//
//  Created by Yehoshua Nagel on 2/6/18.
//  Copyright © 2018 Yehoshua Nagel. All rights reserved.
//

import Foundation

let sharedModel = todoListModel()

class todoListModel {
    struct todoListItem {
        let itemName : String
        let itemDate : Date
    }
    
    public var items : [todoListItem] = [] {
        didSet {
            NotificationCenter.default.post(Notification(name: Notification.Name("itemsUpdated")))
        }
    }
    
    public func addItem(withName name : String?, date : Date) {
        items.append(todoListItem(itemName: name ?? "Unnamed", itemDate: date))
    }
}
