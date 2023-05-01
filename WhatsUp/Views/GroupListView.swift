//
//  GroupListView.swift
//  WhatsUp
//
//  Created by Joy on 2023/05/01.
//

import SwiftUI

// MARK: 탭바처럼 1칸 1칸
struct GroupListView: View {
    
    let groups: [Group]
    
    var body: some View {
        List(groups) { group in
            
            NavigationLink {
                GroupDetailView(group: group)
            } label: {
                HStack {
                    Image(systemName: "person.2")
                    Text(group.subject)
                }
            }
        }
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView(groups: [])
            
    }
}
