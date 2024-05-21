//
//  Repository.swift
//  ToDoList
//
//  Created by Omer Keskin on 20.05.2024.
//

import Foundation
import RxSwift

class Repository{
    
    var taskList = BehaviorSubject<[TaskModel]>(value: [TaskModel]())
    let context = appDelegate.persistentContainer.viewContext
    
    func save(headerDetail: String, taskDetail: String){
        
        let task = TaskModel(context: context)
        task.header = headerDetail
        task.task = taskDetail
        appDelegate.saveContext()
        
    }
    
    func edit(task: TaskModel, headerDetail: String, taskDetail: String){
        
        task.header = headerDetail
        task.task = taskDetail
        appDelegate.saveContext()
        
    }
    
    func delete(task: TaskModel){
        
        context.delete(task)
        appDelegate.saveContext()
    }
    
    
    func showTasks(){
        
        do{
            let fethcRequest = TaskModel.fetchRequest()
            let list = try context.fetch(fethcRequest)
            taskList.onNext(list)
            
        }catch{
            
            print(error.localizedDescription)
        }
        
    }
    
    
    func search(searchText: String){
        
        do{
            let fethcRequest = TaskModel.fetchRequest()
            fethcRequest.predicate = NSPredicate(format: "task CONTAINS[c] %@ OR header CONTAINS[c] %@", searchText, searchText)
            let list = try context.fetch(fethcRequest)
            taskList.onNext(list)
            
        }catch{
            
            print(error.localizedDescription)
        }
        
        
    }
    
    
    
    
    
    
    
}
