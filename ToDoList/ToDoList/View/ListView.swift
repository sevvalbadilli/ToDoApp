//
//  ListView.swift
//  ToDoList
//
//  Created by ŞEVVAL on 10.08.2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        ZStack{
            if listViewModel.listItems.isEmpty{
                NoItemView()
                    .transition(.opacity.animation(.easeIn))
            } else {
                listView
                
            }
        }
        .navigationTitle("To Do List 📝")
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                EditButton()
            }
            
            ToolbarItem(placement: .navigationBarTrailing){
                addButton
            }
        }
        .tint(.purple)
        
    }
}

private extension ListView{
    var listView: some View{
        List{
            ForEach(listViewModel.listItems){
                listItem in
                ListRowView(listItem: listItem)
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel.updateItems(item: listItem)
                        }
                    }
                
            }.onDelete(perform: listViewModel.deleteItems)
             .onMove(perform: listViewModel.moveItem)
            
        }
        .listStyle(.plain)
        
        
    }
    
    var addButton: some View{
        NavigationLink("Add"){
            AddItemView()
        }
    }
}



#Preview {
    NavigationView{
        ListView()
            
    }
    .environmentObject(ListViewModel())
}

