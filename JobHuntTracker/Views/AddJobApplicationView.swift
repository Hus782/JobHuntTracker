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
    @StateObject private var viewModel: AddJobApplicationViewModel = AddJobApplicationViewModel()
    var onAddCompletion: (() -> Void)?
    
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
                    Picker("Status", selection: $viewModel.status) {
                        ForEach(JobStatus.allCases, id: \.self) { status in
                            Text(status.displayName).tag(status)
                        }
                    }
                }
                
                Section(header: Text("Location")) {
                    TextField("Location", text: $viewModel.location)
                }
                
                Section(header: Text("Link")) {
                    TextField("URL", text: $viewModel.link)
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
                    viewModel.addNewJobApplication(context: viewContext)
                    presentationMode.wrappedValue.dismiss() // Dismiss the modal view after saving
                }
            )
            .onAppear {
                viewModel.onAddCompletion = onAddCompletion
            }
        }
    }
    
}

