//
//  todoListModel.swift
//  yehoshuaTaskList
//
//  Created by Yehoshua Nagel on 2/6/18.
//  Copyright © 2018 Yehoshua Nagel. All rights reserved.
//

import Foundation

struct todoListModel {
    struct todoListItem {
        let itemName : String
        let itemDate : Date
    }
    
    public var items : [todoListItem] = [todoListItem(itemName: "Test", itemDate: Date.distantFuture)]
}
