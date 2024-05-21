//
//  Tasks.swift
//  ToDoList
//
//  Created by Omer Keskin on 20.05.2024.
//

import Foundation

class Tasks{
    
    var headerText : String?
    var taskText : String?
    var id : UUID
    
    init(headerText: String, taskText: String, id: UUID) {
        self.headerText = headerText
        self.taskText = taskText
        self.id = id
    }
}
