//
//  TaskViewController.swift
//  task
//
//  Created by 香儿 on 2024/4/9.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var task: String?
    var curPosition: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    

    @IBAction func deleteTask() {
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        let newCount = count - 1
        UserDefaults().setValue(newCount, forKey: "count")
        let index = self.curPosition
        UserDefaults().setValue(nil, forKey: "task_\(index)")
        
        update?()
        navigationController?.popViewController(animated: true)
    }

}
