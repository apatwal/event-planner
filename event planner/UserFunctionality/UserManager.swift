//
//  File.swift
//  event planner
//
//  Created by Aditya Patwal on 8/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserManager(){
    static let shared = UserManager()
    public init(){}
     
    func createNewUser(auth: AuthDataModelResult, firstName: String, lastName: String, userName: String) async throws {
        var userData: [String: Any] = [
            "user_id": auth.uid,
            "email": auth.email,
            "username": userName,
            "first_name": firstName,
            "last_name": lastName,
            "date_created": Timestamp()
        ]
        try await Firestore.firestore().collection("users").document(auth.uid).setData(userData, merge: false)
    }
}
