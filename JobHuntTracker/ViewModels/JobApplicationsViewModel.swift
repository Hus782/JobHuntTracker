//
//  JobApplicationsViewModel.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/21/23.
//

import CoreData
import SwiftUI

final class JobApplicationsViewModel: ObservableObject {
    @Published var jobApplications: [JobApplicationEntity] = []
    
    func fetchJobApplications(viewContext: NSManagedObjectContext) {
        let request: NSFetchRequest<JobApplicationEntity> = JobApplicationEntity.createFetchReques()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \JobApplicationEntity.applicationDate, ascending: true)]
        do {
            jobApplications = try viewContext.fetch(request)
        } catch {
            print("Error fetching: \(error)")
        }
    }
    
    func deleteJobApplications(viewContext: NSManagedObjectContext, at offsets: IndexSet) {
        offsets.forEach { index in
            let entity = jobApplications[index]
            viewContext.delete(entity)
        }
        saveContext(viewContext: viewContext)
    }
    
    var statusCounts: [JobStatus: Int] {
           var counts = [JobStatus: Int]()
           for status in JobStatus.allCases {
               counts[status] = jobApplications.filter { $0.status == status.rawValue }.count
           }
           return counts
       }
    
    private func saveContext(viewContext: NSManagedObjectContext) {
        do {
            try viewContext.save()
            fetchJobApplications(viewContext: viewContext) // Refresh the list
        } catch {
            viewContext.rollback() // Undo changes if save fails
            print("Error saving context: \(error)")
        }
    }
}
