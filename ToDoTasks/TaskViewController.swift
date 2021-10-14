//
//  TaskViewController.swift
//  ToDoTasks
//
//  Created by Apps Azubi on 14.10.21.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet var label: UILabel!
    var task: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))

    }

    @objc func deleteTask(){

        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        let newCount = count - 1

        UserDefaults().setValue(newCount, forKey: "count")

        navigationController?.popViewController(animated: true)

       // UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")

    }

}
