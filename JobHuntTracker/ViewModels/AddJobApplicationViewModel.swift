//
//  AddJobApplicationViewModel.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/21/23.
//

import SwiftUI
import CoreData.NSManagedObjectContext

final class AddJobApplicationViewModel: ObservableObject {
    var onAddCompletion: (() -> Void)?
    @Published var companyName: String = ""
    @Published var jobTitle: String = ""
    @Published var status: JobStatus = .applied
    @Published var location: String = ""
    @Published var link: String = ""
    
    
    func addNewJobApplication(context: NSManagedObjectContext) {
        let newJobApplication = JobApplicationEntity(context: context)
        newJobApplication.companyName = companyName
        newJobApplication.jobTitle = jobTitle
        newJobApplication.applicationDate = Date()
        newJobApplication.lastUpdated = Date()
        newJobApplication.status = status.displayName
        newJobApplication.location = location
        newJobApplication.link = link
        
        do {
            try context.save()
            onAddCompletion?() // Call the completion handler after saving
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
            // Handle the error, perhaps by showing an alert
        }
    }
}
