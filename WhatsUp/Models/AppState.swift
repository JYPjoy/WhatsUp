//
//  AppState.swift
//  WhatsUp
//
//  Created by Joy on 2023/04/30.
//

import Foundation

enum Route: Hashable{
    case main
    case login
    case signUp
}

class AppState: ObservableObject {
    @Published var routes: [Route] = []
}

/*
 @Published is attached to properties inside an ObservableObject, and tells SwiftUI that it should refresh any views that use this property when it is changed. This owns its data.
 */
