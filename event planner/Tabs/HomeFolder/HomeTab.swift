//
//  Home.swift
//  event planner
//
//  Created by Aditya Patwal on 7/27/24.
//

import SwiftUI
import Foundation

struct HomeTab: View{
    
    
    var body : some View{
        NavigationView{
            Text("Homepage")
                .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    NavigationLink(destination: AddFriendPage())
                                    {
                                        Image(systemName:"person.fill.badge.plus")
                                        
                                    }
                                }
                            }
        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
