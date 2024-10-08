//
//  event_plannerApp.swift
//  event planner
//
//  Created by Aditya Patwal on 7/22/24.
//
 
import SwiftUI
import FirebaseCore
import FirebaseAuth



@main
struct event_plannerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                AuthenticationView()
            }
            
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    print("firebase configured")

    return true
  }
}
