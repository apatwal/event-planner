//
//  File.swift
//  event planner
//
//  Created by Aditya Patwal on 8/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserManager{
    static let shared = UserManager()
    private init(){}
     
    
    func addUserToDatabase(user: User) async throws {
        let userData: [String: Any] = [
            "user_id": user.id,
            "email": user.email,
            "username": user.username,
            "first_name": user.firstName,
            "last_name": user.lastName,
            "date_created": Date(),
            "friend_list": [String]()
        ]
        
        let db = Firestore.firestore()
        try await db.collection("users").document(user.id).setData(userData, merge: false)
        try await db.collection("global_information").document("user_list").setData([user.id: user.username])
        
    }
    
    func addGroupToDatabase(group: Group) async throws {
        let groupData: [String: Any] = [
            "group_id": group.id,
            "group_name": group.name,
            "group_members": group.members,
            "date_created": Date()
        ]
        
        let db = Firestore.firestore()
        try await db.collection("groups").document(group.id).setData(groupData, merge: false)
//        try await db.collection("global_information").document("group_list").setData([user.id: user.username])
    }
    
    
    
    
}
