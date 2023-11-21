//
//  AddJobApplicationView.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/21/23.
//

import SwiftUI

struct AddJobApplicationView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State private var companyName: String = ""
    @State private var jobTitle: String = ""
    @State private var status: String = ""
    @State private var location: String = ""
    @State private var link: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Company")) {
                    TextField("Company Name", text: $companyName)
                }
                
                Section(header: Text("Job Title")) {
                    TextField("Role or Title", text: $jobTitle)
                }
                
                Section(header: Text("Status")) {
                    TextField("Current Status", text: $status)
                }
                
                Section(header: Text("Location")) {
                    TextField("Location", text: $location)
                }
                
                Section(header: Text("Link")) {
                    TextField("URL", text: $link)
                }
                
            }
            .navigationBarTitle("New Job", displayMode: .inline)
            .navigationBarItems(
                        leading: Button(action: {
                            presentationMode.wrappedValue.dismiss() // Dismiss the modal view
                        }) {
                            Image(systemName: "xmark")
                        },
                        trailing: Button("Save") {
                            addNewJobApplication()
                            presentationMode.wrappedValue.dismiss() // Dismiss the modal view after saving
                        }
                    )
        }
    }
    
    private func addNewJobApplication() {
            let newJobApplication = JobApplicationEntity(context: viewContext)
            newJobApplication.companyName = companyName
            newJobApplication.jobTitle = jobTitle
            newJobApplication.applicationDate = Date()
            newJobApplication.lastUpdated = Date()
            newJobApplication.status = status
            newJobApplication.location = location
            newJobApplication.link = link
        
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
}

