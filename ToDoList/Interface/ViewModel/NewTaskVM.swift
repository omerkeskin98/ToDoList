//
//  NewTaskVM.swift
//  ToDoList
//
//  Created by Omer Keskin on 20.05.2024.
//

import Foundation

class NewTaskVM{
    
    var repo = Repository()
    
    func saveTask(header: String, task: String){
        
        repo.save(headerDetail: header, taskDetail: task)
    }
    
}
