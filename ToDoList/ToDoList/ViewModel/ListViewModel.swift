//
//  ListViewModel.swift
//  ToDoList
//
//  Created by ŞEVVAL on 9.08.2024.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var listItems: [ToDoItem] = []
    
    private var dataController = DataController.shared
    
    
    init(){
        
        fetchItems()
    }
    
    func fetchItems(){
        listItems = dataController.fetchItems()
    }
    
    
    func deleteItems(at offsets: IndexSet){
        offsets.forEach{ index in
            let item = listItems[index]
            dataController.deleteItem(item: item)
        }
        
        listItems.remove(atOffsets: offsets)
    }
    
    
    func moveItem(from offset: IndexSet, to destination: Int){
        listItems.move(fromOffsets: offset, toOffset: destination)
        
    }
    
    func addItem(title : String){
        _ = dataController.saveNewToDoItem(title: title)
        fetchItems()
        
    }
    
    func updateItems(item: ToDoItem){
        dataController.updateItem(item: item, isCompleted: !item.isCompleted)
        fetchItems()
    }
}

