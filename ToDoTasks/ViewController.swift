//
//  ViewController.swift
//  ToDoTasks
//
//  Created by Apps Azubi on 13.10.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    var tasks = [String()]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Tasks"

        tableView.delegate = self
        tableView.dataSource = self

        // Setup
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }

        // Get all saved tasks
    }

    @IBAction func didTapAdd() {

        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.title = "New Task"
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}
