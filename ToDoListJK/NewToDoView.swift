//
//  NewToDoView.swift
//  ToDoListJK
//
//  Created by Kiran Kari on 6/28/23.
//

import SwiftUI

struct NewToDoView: View {
    
    @State var title: String
    @State var isImportant : Bool
    @Binding var toDoItems : [ToDoItem]
    @Binding var showNewTask : Bool
    
    var body: some View {
        VStack {
            Text("Task title:")
                .font(.title)
                .fontWeight(.bold)
            TextField("Enter the task description...", text: $title)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            Toggle(isOn: $isImportant) {
                Text("Important?")
            }
            .padding()
            Button(action: {
                self.addTask(title: self.title, isImportant: self.isImportant)
                self.showNewTask = false
            }) {
                Text("Add")
            }
                .padding()
        }
    }
    
    private func addTask(title: String, isImportant: Bool = false) {
        
        let task = ToDoItem(title: title, isImportant: isImportant)
        toDoItems.append(task)
        
    }
    
}
    
struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(title:"", isImportant: false, toDoItems: .constant([]), showNewTask: .constant(true))
    }
}
