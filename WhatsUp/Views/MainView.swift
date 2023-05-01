//
//  MainView.swift
//  WhatsUp
//
//  Created by Joy on 2023/04/30.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            GroupListContainerView()
               
                .tabItem {
                    Label("Chats", systemImage: "message.fill")
                }
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
