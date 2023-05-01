//
//  GroupDetailView.swift
//  WhatsUp
//
//  Created by Joy on 2023/05/01.
//

import SwiftUI

struct GroupDetailView: View {
    
    let group: Group
    @EnvironmentObject private var model: Model
    @State private var chatText: String = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            TextField("Enter chat message", text: $chatText)
            Button("Send") {
                model.saveChatMessageToGroup(text: chatText, group: group) { error in
                    
                }
            }
        }.padding()
    }
}

struct GroupDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GroupDetailView(group: Group(subject: "Movies"))
            .environmentObject(Model())
    }
}
