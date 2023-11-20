//
//  JobApplicationDetailsView.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/20/23.
//

import SwiftUI

struct JobApplicationDetailsView: View {
    var jobApplication: JobApplicationEntity

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(jobApplication.jobTitle)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                    Text(jobApplication.companyName)
                        .font(.title2)
                        .foregroundColor(.secondary)

                    Text("Applied on \(jobApplication.applicationDate, formatter: itemFormatter)")
                        .font(.body)
                        .foregroundColor(.secondary)

                Text("Status: \(jobApplication.status)")
                    .font(.headline)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .none
    return formatter
}()

