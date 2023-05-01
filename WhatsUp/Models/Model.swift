//
//  Model.swift
//  WhatsUp
//
//  Created by Joy on 2023/04/30.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

//이 앱에 대한 모든 요소들이 들어가 있는 유일한 Model
@MainActor
class Model: ObservableObject {
    @Published var groups: [Group] = []
    
    func updateDisplayName(for user: User, displayName: String) async throws {
        let request = user.createProfileChangeRequest()
        request.displayName = displayName
        try await request.commitChanges()
    }
    
    func populateGroups() async throws{
        let db = Firestore.firestore()
        let snapshot = try await db.collection("groups")
            .getDocuments()
        groups = snapshot.documents.compactMap { snapshot in
            Group.fromSnapshot(snapshot: snapshot)
        }
    }
    
    func saveChatMessageToGroup(chatMessage: ChatMessage, group: Group) async throws {
        let db = Firestore.firestore()
        guard let groupDocumentId = group.documentId else {return}
        let _ = try await db.collection("groups")
            .document(groupDocumentId)
            .collection("message")
            .addDocument(data: chatMessage.toDictionary())
    }
    
    /*
    func saveChatMessageToGroup(text: String, group: Group, completion: @escaping (Error?) -> Void) {
        
        let db = Firestore.firestore()
        guard let groupDocumentId = group.documentId else { return }
        db.collection("groups")
            .document(groupDocumentId)
            .collection("messages")
            .addDocument(data: ["chatText": text]) { error in
                completion(error)
            }
    }
    */
    
    
    func saveGroup(group: Group, completion: @escaping (Error?) -> Void){
        let db = Firestore.firestore()
        var docRef: DocumentReference? = nil
        docRef = db.collection("groups")
            .addDocument(data: group.toDictionary()) {[weak self] error in
                if error != nil {
                    completion(error)
                } else {
                    //add the group to groups array
                    if let docRef {
                        var newGroup = group
                        newGroup.documentId = docRef.documentID
                        self?.groups.append(newGroup)
                        completion(nil)
                    } else {
                        completion(nil)
                    }
                }
            }
    }
}
