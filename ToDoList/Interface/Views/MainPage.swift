//
//  ViewController.swift
//  ToDoList
//
//  Created by Omer Keskin on 20.05.2024.
//

import UIKit

class MainPage: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var mainPageVM = MainPageVM()
    var taskList = [TaskModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        _ = mainPageVM.taskList.subscribe(onNext: { liste in
            self.taskList = liste
            self.tableView.reloadData()
        })
        
        
        let newTaskButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(toNewTaskVC))
        self.navigationItem.rightBarButtonItem = newTaskButton
    }

    override func viewWillAppear(_ animated: Bool) {
        mainPageVM.showTasks()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            mainPageVM.showTasks()
        }
        else{
            mainPageVM.search(searchText: searchText)
        }
        
    }
    
    
    @objc func toNewTaskVC(){
        
        performSegue(withIdentifier: "toNewTaskVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            if let task = sender as? TaskModel{
                let destination = segue.destination as! DetailVC
                destination.task = task
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! MainListTableViewCell
        let task = taskList[indexPath.row]
        cell.headerCellTF.text = task.header
        cell.detailCellTF.text = task.task
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = taskList[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: task)
        tableView.deselectRow(at: indexPath, animated: false)
    }

    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            let task = self.taskList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "Do you want to delete this task?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Delete", style: .destructive){_ in
                self.mainPageVM.delete(task: task)}
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

