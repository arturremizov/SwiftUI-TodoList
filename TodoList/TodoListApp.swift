//
//  TodoListApp.swift
//  TodoList
//
//  Created by Artur Remizov on 29.09.22.
//

import SwiftUI

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
        }
    }
}
