//
//  ContentView.swift
//  event planner
//
//  Created by Aditya Patwal on 7/22/24.
//

import SwiftUI
import Combine

enum Words : String, CaseIterable{
    case chicken, egg, farm
}
struct ContentView: View {
    
    @State var selection : Words = .chicken
    var body: some View {
        
        
        TabView{
            HomeTab()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            GroupTab()
                .tabItem { 
                    Image(systemName: "person")
                    Text("Group")
                }
            SettingsTab()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .accentColor(.red)
        
        
    }
}

#Preview {
    ContentView()
}
