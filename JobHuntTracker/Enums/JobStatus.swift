//
//  JobStatus.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/22/23.
//


enum JobStatus: String, CaseIterable {
    case applied = "Applied"
    case interviewing = "Interviewing"
    case open = "Open"
    case closed = "Closed"
    

    var displayName: String {
        self.rawValue
    }
}
