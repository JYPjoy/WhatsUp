//
//  AddNewGroupView.swift
//  WhatsUp
//
//  Created by Joy on 2023/05/01.
//
// @Environment lets us read data from the system, such as color scheme, accessibility options, and trait collections, but you can add your own keys here if you want. This does not own its data.

import SwiftUI

struct AddNewGroupView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var model: Model
    @State private var groupSubject: String = ""
    
    private var isFormValid: Bool {
        !groupSubject.isEmptyOrWhiteSpace
    }
    
    private func saveGroup() {
        let group = Group(subject: groupSubject)
        model.saveGroup(group: group) { error in
            if let error {
                print(error.localizedDescription)
            }
            dismiss()
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Group Subject", text: $groupSubject)
                }
                Spacer()
            } .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("New Group")
                        .bold()
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Create") {
                        saveGroup()
                    }.disabled(!isFormValid)
                }
            }
            
        }.padding()
        
    }
}

struct AddNewGroupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddNewGroupView()
                .environmentObject(Model())
        }
    }
}
