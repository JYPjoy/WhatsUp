//
//  GroupListcontainerView.swift
//  WhatsUp
//
//  Created by Joy on 2023/05/01.
//

import SwiftUI

struct GroupListContainerView: View {
    
    @State private var isPresented: Bool = false
    @EnvironmentObject private var model: Model
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("New Group") {
                    isPresented = true
                }
            }
            
            GroupListView(groups: model.groups)
            
            Spacer()
        }
      
        .task { //Adds an asynchronous task to perform before this view appears.
            do {
                try await model.populateGroups()
            } catch {
                print(error)
            }
        }
        .padding()
            .sheet(isPresented: $isPresented) {
                AddNewGroupView()
            }
    }
}

struct GroupListContainerView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListContainerView()
            .environmentObject(Model())
    }
}
