//
//  JobApplication.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/18/23.
//

import Foundation

struct JobApplication: Identifiable {
    var id = UUID()
    var companyName: String
    var jobTitle: String
    var applicationDate: String
    var status: String
    var logoName: String
    
}
