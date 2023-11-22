//
//  EditJobApplicationViewModel.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/21/23.
//

import SwiftUI
import CoreData.NSManagedObjectContext

final class EditJobApplicationViewModel: ObservableObject {
    private var jobApplication: JobApplicationEntity
    
    @Published var companyName: String = ""
    @Published var jobTitle: String = ""
    @Published var status: JobStatus = .applied
    @Published var location: String = ""
    @Published var link: String = ""
    @Published var applicationDate: Date = Date()
    
    init(jobApplication: JobApplicationEntity) {
        self.jobApplication = jobApplication
        
        // Initialize the published properties with existing values
        companyName = jobApplication.companyName
        jobTitle = jobApplication.jobTitle
        status =  JobStatus(rawValue: jobApplication.status) ?? .applied
        location = jobApplication.location
        link = jobApplication.link
    }
    
    func updateJobApplication(context: NSManagedObjectContext) {
        jobApplication.companyName = companyName
        jobApplication.jobTitle = jobTitle
        jobApplication.status = status.displayName
        jobApplication.location = location
        jobApplication.link = link
        jobApplication.applicationDate = applicationDate
        jobApplication.lastUpdated = Date()
        
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
            // Handle the error, perhaps by showing an alert
        }
    }
    
}
