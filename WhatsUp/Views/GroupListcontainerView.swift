//
//  GroupListcontainerView.swift
//  WhatsUp
//
//  Created by Joy on 2023/05/01.
//

import SwiftUI

struct GroupListcontainerView: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button("New Group"){
                    isPresented = true
                }
            }
            Spacer()
        }.padding()
            .sheet(isPresented: $isPresented) {
                AddNewGroupView()
            }
    }
}

struct GroupListcontainerView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListcontainerView()
    }
}
