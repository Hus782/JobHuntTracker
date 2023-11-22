//
//  JobStatus.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/22/23.
//


enum JobStatus: String, CaseIterable {
    case applied = "Applied"
    case interviewing = "Interviewing"
    case offer = "Offer"
    case rejected = "Rejected"
    case accepted = "Accepted"
    case withdrawn = "Withdrawn"

    var displayName: String {
        self.rawValue
    }
}
