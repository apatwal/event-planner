//
//  GroupCell.swift
//  event planner
//
//  Created by Aditya Patwal on 7/28/24.
//

import Foundation
import SwiftUI

struct GroupCell: View {
    //let groupProfilePicURL: String
    @State var groupName: String
    
    var body: some View{
        
        NavigationLink{
            Text("Destination")
        } label :{
            HStack{
                Image(systemName:"person.fill")
                    .font(.system(size: 32))
                    .padding(8)
                    .overlay(RoundedRectangle(cornerRadius: 44)
                        .stroke(Color(.label),lineWidth: 1))
                Text(groupName)
            }
        }
        
    }
}
