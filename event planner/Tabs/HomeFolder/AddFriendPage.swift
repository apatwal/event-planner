//
//  AddFriendPage.swift
//  event planner
//
//  Created by Aditya Patwal on 8/7/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct AddFriendPage: View {
    @State private var searchText = ""
    @State private var items = [String]()
    
    func fetch_user_list(){
        let db = Firestore.firestore()
        db.collection("global_information").document("user_list").getDocument {
            snapshot, error in
            
            if error == nil{
                
                if let snapshot = snapshot, let data = snapshot.data(){
                    
                    let values = data.values.compactMap { $0 as? String }
                                    // Update the 'items' array on the main thread
                                    DispatchQueue.main.async {
                                        self.items = values
                                    }
                    
                }
            }
        }
        
    }
    
    
    
    
    
    
    var filteredItems: [String] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    var body: some View {
        NavigationView {
                    List {
                        ForEach(filteredItems, id: \.self) { item in
                            Navigation(UserProfile())
                        }
                    }
                    .navigationTitle("Add Friends")
                    .searchable(text: $searchText, prompt: "Search")
                    .onAppear(perform: {
                        fetch_user_list()
                    })
                    
                }
        
//        VStack {
//                   Button(action: {
//                       fetch_user_list()
//                   }) {
//                       Text("Fetch User List")
//                           .padding()
//                           .background(Color.blue)
//                           .foregroundColor(.white)
//                           .cornerRadius(8)
//                   }
//                   
//                   Button(action: {
//                       print("Items: \(items)")
//                   }) {
//                       Text("Print User List")
//                           .padding()
//                           .background(Color.green)
//                           .foregroundColor(.white)
//                           .cornerRadius(8)
//                   }
//               }
//               .padding()
    }
}

#Preview {
    AddFriendPage()
}
