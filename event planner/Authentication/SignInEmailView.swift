//
//  SignInEmailView.swift
//  event planner
//
//  Created by Aditya Patwal on 7/28/24.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isAuthenticated = false
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
        
        Task{
            do {
                let returnedUserData: () = try await
                AuthenticationManager.shared.loginUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
                isAuthenticated = true
            } catch {
                print("Error: \(error)")
                isAuthenticated = false
            }
        }
    }
}


struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    
    var body: some View {
        
        NavigationStack{
            VStack {
                TextField("Email...", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password...", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                Button() {
                    viewModel.signIn()
                } label: {
                    Text("Sign in")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                NavigationLink(
                    destination: CreateAccountView(),
                    label: {
                        Text("Create Account")
                    })
                .padding()
                
                Spacer()
            }
            .padding()
            .navigationTitle("Sign in with email")
            .navigationDestination(isPresented: $viewModel.isAuthenticated) {
                ContentView()
            }
            
        }
        
    }
}


#Preview {
    NavigationStack {
        SignInEmailView()
    }
}
