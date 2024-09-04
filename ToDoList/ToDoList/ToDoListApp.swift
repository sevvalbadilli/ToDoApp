//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by ŞEVVAL on 8.08.2024.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject private var listViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .accentColor(.brown)
            .environmentObject(listViewModel)
            
        }
    }
}
