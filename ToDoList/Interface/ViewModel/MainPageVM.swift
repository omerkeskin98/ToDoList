//
//  MainPageVM.swift
//  ToDoList
//
//  Created by Omer Keskin on 20.05.2024.
//

import Foundation
import RxSwift

class MainPageVM{
    
    var taskList = BehaviorSubject<[TaskModel]>(value: [TaskModel]())
    var repo = Repository()
    
    
    init(){
        taskList = repo.taskList
    }
    
    
    func search(searchText: String){
        
        repo.search(searchText: searchText)
    }
    
    func delete(task: TaskModel){
        
        repo.delete(task: task)
        showTasks()
        
    }
    
    func showTasks(){
        
        repo.showTasks()
    }
    
}
