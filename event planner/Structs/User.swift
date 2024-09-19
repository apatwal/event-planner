//
//  User.swift
//  event planner
//
//  Created by Aditya Patwal on 8/7/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


struct User{
    var firstName: String
    var lastName: String
    var username: String
    var id: String
    var email: String
    var dateCreated: Date
    var friendList: Set<String>
    
    init(auth: AuthDataModelResult, firstName: String, lastName: String, username: String){
        
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.id = auth.uid
        self.email = auth.email
        self.dateCreated = Date()
        self.friendList = Set<String>()
    }
    
    mutating func addFriend(friend: inout User) async throws{
        if(!self.friendList.contains(friend.id)){
            self.friendList.insert(friend.id) //add friendId to self.friendlist
            friend.friendList.insert(self.id) //add selfId to friend.friendlist
            try await Firestore.firestore().collection("users").document(self.id).updateData(["friendList" : friendList])
        }
        
    }

}
