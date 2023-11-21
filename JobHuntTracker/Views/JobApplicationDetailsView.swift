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
            VStack(alignment: .leading, spacing: 15) {
                
                DetailView(title: "Status", detail: jobApplication.status, icon: "person.crop.circle.badge.checkmark")
                DetailView(title: "Company", detail: jobApplication.companyName, icon: "building.2.crop.circle")
                DetailView(title: "Role", detail: jobApplication.jobTitle, icon: "briefcase")
                DetailView(title: "Location", detail: jobApplication.location, icon: "mappin.and.ellipse")
                DetailView(title: "Link", detail: jobApplication.link, isLink: true, icon: "link")
                DetailView(title: "Applied Date", detail: itemFormatter.string(from: jobApplication.applicationDate), icon: "calendar")
                DetailView(title: "Last Updated", detail: itemFormatter.string(from: jobApplication.lastUpdated), icon: "arrow.up.arrow.down.circle")
                
                Spacer()
                
                    .navigationBarItems(
                        trailing: Button(action: editApplication) {
                            Text("Edit")
                        }
                    )
                
            }
            .padding()
        }
    }
    
    private func editApplication() {
        
    }
}


struct DetailView: View {
    let title: String
    let detail: String
    var isLink: Bool = false // Conditionally render a Link view
    var icon: String? // Optional icon name

    var body: some View {
        HStack {
            if let icon = icon {
                Image(systemName: icon)
                    .foregroundColor(.accentColor)
                    .frame(width: 24, alignment: .center)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(title.uppercased())
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                if isLink, let url = URL(string: detail) {
                    Link(detail, destination: url)
                        .font(.body)
                        .foregroundColor(.blue)
                } else {
                    Text(detail)
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(8)
    }
}


private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .none
    return formatter
}()

