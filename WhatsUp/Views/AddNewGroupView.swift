//
//  AddNewGroupView.swift
//  WhatsUp
//
//  Created by Joy on 2023/05/01.
//

import SwiftUI

struct AddNewGroupView: View {
    @State private var groupSubject: String = ""
    @Environment(\.dismiss) private var dismiss
    // @Environment lets us read data from the system, such as color scheme, accessibility options, and trait collections, but you can add your own keys here if you want. This does not own its data.
    private var isFormValid: Bool{
        !groupSubject.isEmptyOrWhiteSpace
    }
    
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    TextField("Group Subject", text: $groupSubject)
                }
                Spacer()
            }.padding()
                .toolbar{ //툴바 Populates the toolbar or navigation bar with the specified items
                    ToolbarItem(placement: .principal){
                        Text("New Group")
                            .bold()
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading){
                        Button("Cancel"){
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Create"){
                        }
                        .disabled(!isFormValid)
                    }
                }
        }
    }
}

struct AddNewGroupView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGroupView()
    }
}
