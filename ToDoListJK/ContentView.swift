//
//  ContentView.swift
//  ToDoListJK
//
//  Created by Jahnavi Kari on 6/28/23.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(
            entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
        
    var toDoItems: FetchedResults<ToDo>
    @State private var showNewTask = false
    
    var body: some View {
        VStack {
            HStack {
                Text("To Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                
                Spacer()
                
                Button(action: {
                    self.showNewTask = true
                }) {
                    Text("+")
                }
                
                Spacer()
                
            }
            .padding(50)
        }
        
        if showNewTask {
            NewToDoView(title: "", isImportant: false, showNewTask: $showNewTask)
        }
        
        List {
            ForEach(toDoItems) { toDoItem in
                if toDoItem.isImportant == true {
                    Text("‼️" + (toDoItem.title ?? "No title"))
                } else {
                                    Text(toDoItem.title ?? "No title")
                }
            }
        }
            .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
