//
//  AuthenticationManager.swift
//  event planner
//
//  Created by Aditya Patwal on 7/28/24.
//

import Foundation
import FirebaseAuth

struct AuthDataModelResult{
    let uid : String
    let email : String // optional
//    let photoUrl : String?
    
    init(user: FirebaseAuth.User){
        self.uid = user.uid
        self.email = user.email ?? "no email"
//        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager{
    // Use dependency injection for better design. Singleton is not good practice
    static let shared = AuthenticationManager()
    private init(){
        
    }
    
    
    func createUser(email: String, password: String, firstName: String, lastName: String, username: String) async throws{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let result = AuthDataModelResult(user: authDataResult.user)
        let newUser = User(auth: result, firstName: firstName, lastName: lastName, username: username)
        try await UserManager.shared.addUserToDatabase(user: newUser)
        
    }
    
    func loginUser(email: String, password: String) async throws{
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
    }
}

