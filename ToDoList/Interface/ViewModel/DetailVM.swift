//
//  DetailVM.swift
//  ToDoList
//
//  Created by Omer Keskin on 20.05.2024.
//

import Foundation

class DetailVM{
    
    var repo = Repository()
    
    func updateTask(task: TaskModel, header: String, taskDetail: String){
        repo.edit(task: task, headerDetail: header, taskDetail: taskDetail)
        
    }
}
