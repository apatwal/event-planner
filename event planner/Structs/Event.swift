//
//  Event.swift
//  event planner
//
//  Created by Aditya Patwal on 8/7/24.
//

import Foundation


struct Event{
    var eventId: String
    var eventName: String
    var eventDate: Date
    var eventAddress: String
    var eventAttendance: Int
    
    init(eventId: String, eventName: String, eventDate: Date, eventAddress: String, eventAttendance: Int) {
        self.eventId = eventId
        self.eventName = eventName
        self.eventDate = eventDate
        self.eventAddress = eventAddress
        self.eventAttendance = eventAttendance
    }
}
