//
//  ChatMessageListView.swift
//  WhatsUp
//
//  Created by Joy on 2023/05/01.
//

import SwiftUI

struct ChatMessageListView: View {
    
    let chatMessages: [ChatMessage]
    
    var body: some View {
        List(chatMessages){ chatMessage in
            Text(chatMessage.text)
        }
    }
}

struct ChatMessageListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageListView(chatMessages: [])
    }
}
