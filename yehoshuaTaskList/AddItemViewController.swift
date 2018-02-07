//
//  AddItemViewController.swift
//  yehoshuaTaskList
//
//  Created by Yehoshua Nagel on 2/6/18.
//  Copyright © 2018 Yehoshua Nagel. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController : UIViewController, UITextFieldDelegate {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    private var taskName : String? {
        get {
            return (titleField.text == "") ? nil : titleField.text
        }
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        if datePicker.date.isInPast() {
            let overdueAlert = UIAlertController(title: "Date overdue", message: "Todo item '\(taskName ?? "Unnamed")' is overdue", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (_) in self.save() })
            overdueAlert.addAction(okAction)
            self.present(overdueAlert, animated: true)
        } else {
            save()
        }
    }
    
    private func save() {
        sharedModel.addItem(withName : taskName, date : datePicker.date)
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension Date {
    func isInPast() -> Bool {
        return self < Date()
    }
}
