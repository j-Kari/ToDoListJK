//
//  ToDoListJKApp.swift
//  ToDoListJK
//
//  Created by Jahnavi Kari on 6/28/23.
//

import SwiftUI

@main
struct ToDoListJKApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
