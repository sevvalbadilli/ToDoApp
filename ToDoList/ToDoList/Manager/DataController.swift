//
//  DataController.swift
//  ToDoList
//
//  Created by ŞEVVAL on 9.08.2024.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    
    //Singleton Pattern
    static let shared = DataController()
    
    private var persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    private init (){
        
        persistentContainer = NSPersistentContainer(name: "ToDoItem")
        persistentContainer.loadPersistentStores{_, error in
            
            if let error = error{
                fatalError("Unresolved error \(error.localizedDescription)")
            }
            
        }
        viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
    }
    
    func saveNewToDoItem(title: String) -> Bool{
        let todoItem = ToDoItem(context: viewContext)
        
        todoItem.id = UUID().uuidString
        todoItem.title = title
        todoItem.isCompleted = false
        
        do{
            try viewContext.save()
            return true
        } catch{
            print("Filed to save New To Do Item : \(error.localizedDescription)")
            return false
        }
    }
    
    func fetchItems() -> [ToDoItem]{
        
        let fetchRequest : NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest()
        
        do{
            
            return try viewContext.fetch(fetchRequest)
        } catch{
            print("Failed to fetch TO DO Items: \(error.localizedDescription)")
            
            return []
        }
        
    }
    
    func deleteItem(item: ToDoItem){
        viewContext.delete(item)
        
        do{
            
            try viewContext.save()
        } catch{
            print("failed to delete to do item: \(error.localizedDescription)")
            
        }
        
    }
    
    func updateItem(item: ToDoItem, isCompleted: Bool? = nil){
        
        if let isCompleted = isCompleted{
            item.isCompleted = isCompleted
        }
        
        do{
            
            try viewContext.save()
        } catch{
            
            print("failed to uptade to do item: \(error.localizedDescription)")
        }
    }
  
}
