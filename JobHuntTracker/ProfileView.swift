//
//  ProfileView.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/14/23.
//

import SwiftUI

struct ProfileOverviewView: View {
    var userName: String
    var userTitle: String
    var applicationsThisMonth: Int
    var monthlyTarget: Int

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Hello, \(userName)")
                    .font(.headline)
                    .fontWeight(.bold)

                Text(userTitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Applications this month")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("\(applicationsThisMonth)")
                            .font(.title3)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Monthly Target")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("\(monthlyTarget)")
                            .font(.title3)
                    }
                }
                
                ProgressView(value: Float(applicationsThisMonth), total: Float(monthlyTarget))
                    .progressViewStyle(LinearProgressViewStyle())
                    .accentColor(applicationsThisMonth >= monthlyTarget ? .green : .blue)
            }
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width * 0.75, alignment: .leading)
            
            Spacer() // Pushes the VStack to the left
        }
        .padding(.horizontal)
    }
}
