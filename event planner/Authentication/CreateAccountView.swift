//
//  CreateAccountView.swift
//  event planner
//
//  Created by Aditya Patwal on 7/28/24.
//

import Foundation
import SwiftUI
@MainActor
final class CreateAccountViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var userName = ""
    
    func createAccount() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
        
        Task{
            do {
                let returnedUserData: () = try await AuthenticationManager.shared.createUser(email: email, password: password, firstName: firstName, lastName: lastName, username: userName)
                print("Success")
                print(returnedUserData)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

struct CreateAccountView: View {
    @StateObject private var viewModel = CreateAccountViewModel()
    var body: some View {
        VStack {
            // First Name   Last Name
            HStack{
                VStack(alignment: .leading){
                    Text("First Name")
                    TextField("", text: $viewModel.firstName)
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.words)
                }
                
                VStack(alignment: .leading){
                    Text("Last Name")
                    TextField("", text: $viewModel.lastName)
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.words)
                }
                
            }
            .padding(.bottom)
            // Username
            VStack(alignment: .leading){
                Text("Username")
                TextField("", text: $viewModel.userName)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
            }
            .padding(.bottom)
            
            VStack(alignment: .leading){
                Text("Email")
                TextField("", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
            }
            .padding(.bottom)
            
            
            VStack(alignment: .leading){
                Text("Password")
                SecureField("", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
            }
            .padding(.bottom)
            
            
            Button {
                
                    viewModel.createAccount()
                
            } label: {
                Text("Create Account")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Create Account")
        
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
