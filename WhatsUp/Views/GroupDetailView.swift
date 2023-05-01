//
//  GroupDetailView.swift
//  WhatsUp
//
//  Created by Joy on 2023/05/01.
//

import SwiftUI
import FirebaseAuth

struct GroupDetailView: View {
    
    let group: Group
    @EnvironmentObject private var model: Model
    @State private var chatText: String = ""
    
    private func sendMessage() async throws {
        
        guard let currentUser = Auth.auth().currentUser else { return }
        
        let chatMessage = ChatMessage(text: chatText, uid: currentUser.uid, displayName: currentUser.displayName ?? "Guest")
        
        try await model.saveChatMessageToGroup(chatMessage: chatMessage, group: group)
        
    }
    
    var body: some View {
        VStack {
            
            Spacer()
            TextField("Enter chat message", text: $chatText)
            Button("Send") {
                Task {
                    do {
                        try await sendMessage()
                    } catch {
                        print(error.localizedDescription)
                    }
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
