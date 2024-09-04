//
//  ListRowView.swift
//  ToDoList
//
//  Created by ŞEVVAL on 10.08.2024.
//

import SwiftUI

struct ListRowView: View {
    @ObservedObject var listItem: ToDoItem
    var body: some View {
        HStack{
            statusImage
            titleText
            Spacer()
            
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}


private extension ListRowView{
    var statusImage: some View{
        Image(systemName: listItem.isCompleted ? "checkmark.circle" : "circle")
            .foregroundStyle(listItem.isCompleted ? .green : .red)
    }
    
    var titleText: some View{
        
        Text(listItem.title ?? "Unknow")
            .strikethrough(listItem.isCompleted, color: .black)
    }
}

/*
#Preview {
    ListRowView()
}
*/
