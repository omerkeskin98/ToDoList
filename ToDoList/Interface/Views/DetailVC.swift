//
//  DetailVC.swift
//  ToDoList
//
//  Created by Omer Keskin on 20.05.2024.
//

import UIKit

class DetailVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var headerTF: UITextView!

    @IBOutlet weak var detailTF: UITextView!
   
    
    var task : TaskModel?
    var detailVM = DetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let updateButton = UIBarButtonItem(title: "Update", style: .plain, target: self, action: #selector(updateTask))
        self.navigationItem.rightBarButtonItem = updateButton
      
        
        if let t = task{
            headerTF.text = t.header
            detailTF.text = t.task
        }
        
        headerTF.delegate = self
        detailTF.delegate = self
        
    }
    

    @objc func updateTask(){
        
        if let updatedTask = task, let header = headerTF.text, let detailTask = detailTF.text{
            detailVM.updateTask(task: updatedTask, header: header, taskDetail: detailTask)
            
            let alert = UIAlertController(title: "Updated", message: "Task has been updated", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
               self.navigationController?.popViewController(animated: true)
           }))
            present(alert, animated: true, completion: nil)
        }
    }

}
