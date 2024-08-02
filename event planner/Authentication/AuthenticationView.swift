//
//  AuthenticationView.swift
//  event planner
//
//  Created by Aditya Patwal on 7/28/24.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        
        VStack{
            
            NavigationLink{
                SignInEmailView()
            } label : {
                Text("Sign in with email")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("sign in")
    }
}

#Preview {
    NavigationStack{
        AuthenticationView()
    }
}
