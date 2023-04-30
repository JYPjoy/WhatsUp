//
//  Model.swift
//  WhatsUp
//
//  Created by Joy on 2023/04/30.
//

import Foundation
import FirebaseAuth

@MainActor
class Model: ObservableObject {
    func updateDisplayName(for user: User, displayName: String) async throws {
        let request = user.createProfileChangeRequest()
        request.displayName = displayName
        try await request.commitChanges()
    }
}

/*
 
 
 
 */
