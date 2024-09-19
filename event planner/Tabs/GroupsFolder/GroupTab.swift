//
//  Group.swift
//  event planner
//
//  Created by Aditya Patwal on 7/27/24.
//


import SwiftUI
import Foundation

struct GroupTab: View{
    
    
    var body : some View{
        NavigationView{
            List{
                GroupCell(groupName: "Group 1")
                GroupCell(groupName: "Group 2")
            }
            .navigationTitle("Groups")
            .listStyle(PlainListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddGroupView())
                    {
                        Image(systemName:"plus")
                        
                    }
                }
            }
            
        }
    }
}

struct GroupTab_Previews: PreviewProvider {
    static var previews: some View {
        GroupTab()
    }
}
