//
//  ItemModel.swift
//  TodoList
//
//  Created by Artur Remizov on 29.09.22.
//

import Foundation

struct ItemModel: Identifiable {
    var id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
