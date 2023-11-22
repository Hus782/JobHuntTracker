//
//  EditJobApplicationView.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/21/23.
//

import SwiftUI

struct EditJobApplicationView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: EditJobApplicationViewModel
    var onAddCompletion: (() -> Void)?
    
    init(jobApplication: JobApplicationEntity) {
           _viewModel = StateObject(wrappedValue: EditJobApplicationViewModel(jobApplication: jobApplication))
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Company")) {
                    TextField("Company Name", text: $viewModel.companyName)
                }
                
                Section(header: Text("Job Title")) {
                    TextField("Role or Title", text: $viewModel.jobTitle)
                }
                
                Section(header: Text("Status")) {
                    TextField("Current Status", text: $viewModel.status)
                }
                
                Section(header: Text("Location")) {
                    TextField("Location", text: $viewModel.location)
                }
                
                Section(header: Text("Link")) {
                    TextField("URL", text: $viewModel.link)
                }
                
                Section(header: Text("Application Date")) {
                    DatePicker("Application Date", selection: $viewModel.applicationDate, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                }
            }
            .navigationBarTitle("Edit Job", displayMode: .inline)
            .navigationBarItems(
                        leading: Button(action: {
                            presentationMode.wrappedValue.dismiss() // Dismiss the modal view
                        }) {
                            Image(systemName: "xmark")
                        },
                        trailing: Button("Save") {
                            viewModel.updateJobApplication(context: viewContext)
                            presentationMode.wrappedValue.dismiss() // Dismiss the modal view after saving
                        }
                    )
//            .onAppear {
//                    viewModel.onAddCompletion = onAddCompletion
//                }
        }
    }
    
}

