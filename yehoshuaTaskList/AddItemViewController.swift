//
//  AddItemViewController.swift
//  yehoshuaTaskList
//
//  Created by Yehoshua Nagel on 2/6/18.
//  Copyright © 2018 Yehoshua Nagel. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController : UIViewController {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func saveTapped(_ sender: UIButton) {
        sharedModel.addItem(withName : titleField.text, date : datePicker.date)
        self.navigationController?.popViewController(animated: true)
    }
}
