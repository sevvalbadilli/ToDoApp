//
//  AddItemView.swift
//  ToDoList
//
//  Created by ŞEVVAL on 10.08.2024.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var textFieldText = ""
    @EnvironmentObject private var listViewModel: ListViewModel
    
    @State private var alertState: AlertState? = nil
    var body: some View {
        ScrollView{
            VStack{
                textField
                saveButton
            }
            .padding()
        }.navigationTitle("Add an Item 🖋️")
            .alert(item: $alertState) { state in
                
                Alert(title: Text(state.title))
            }
            
        
    }
}

private extension AddItemView{
    
    var textField: some View{
        TextField("Type here", text: $textFieldText)
            .padding(.horizontal)
            .frame(height: 55)
            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.798))
            .cornerRadius(10)
    }
    
    var saveButton: some View{
        Button("Save"){
            saveButtonPressed()
        }
        .foregroundStyle(.white)
        .font(.headline)
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(.purple)
        .cornerRadius(10)
    }
    
    struct AlertState: Identifiable{
        let id = UUID()
        let title: String
    }
    
}
private extension AddItemView{
    
    func saveButtonPressed(){
        guard textIsAppropriate() else {return}
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
        
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || textFieldText.count < 3{
            
            alertState = AlertState(title: "your new todo list item must be at 3 characters long!!😰😱😨")
            return false
        }
        return true
    }
}



#Preview {
    NavigationView{
        AddItemView()
            .tint(.purple)
    }
    .environmentObject(ListViewModel())
}
