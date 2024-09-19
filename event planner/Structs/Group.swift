//
//  Group.swift
//  event planner
//
//  Created by Aditya Patwal on 8/7/24.
//

import Foundation


struct Group{
    var members: [String]
    var name: String
    var id: String
//    var eventList: [String]
    
    init(userList: [String], groupName: String, id: String) {
        self.members = userList
        self.name = groupName
        self.id = id
    }
    
    
    
}
