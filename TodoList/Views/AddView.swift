//
//  AddView.swift
//  TodoList
//
//  Created by Artur Remizov on 29.09.22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 10))
                
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊")
        .alert(alertTitle, isPresented: $showAlert) { }
    }
    
    func saveButtonPressed() {
        guard textIsAppropriate() else { return }
        listViewModel.addItem(title: textFieldText)
        dismiss()
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long! 😨😰😱"
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                AddView()
            }
            NavigationStack {
                AddView()
            }
            .preferredColorScheme(.dark)
        }
        
        .environmentObject(ListViewModel())
    }
}
