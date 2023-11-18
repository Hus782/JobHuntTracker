//
//  TopStatusView.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/14/23.
//

import SwiftUI

struct StatusButtonView: View {
    var status: String
    var count: Int
    var color: Color
    
    var body: some View {
        VStack {
            Text(status)
                .font(.subheadline) // Smaller font size
                .foregroundColor(.white)
            Text("\(count)")
                .font(.title3) // Smaller font size
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 60, height: 60) // Smaller frame
        .background(color)
        .cornerRadius(10)
    }
}

struct TopStatusView: View {
    // Sample data
    var openCount = 3
    var appliedCount = 4
    var interviewCount = 2
    var closedCount = 2

    var body: some View {
        HStack(spacing: 24) { // Increased spacing between buttons
            StatusButtonView(status: "Open", count: openCount, color: Color.green.opacity(0.7)) // Softer color
            StatusButtonView(status: "Applied", count: appliedCount, color: Color.blue.opacity(0.7)) // Softer color
            StatusButtonView(status: "Interview", count: interviewCount, color: Color.orange.opacity(0.7)) // Softer color
            StatusButtonView(status: "Closed", count: closedCount, color: Color.red.opacity(0.7)) // Softer color
        }
        .padding(.top, 8)
        .padding(.horizontal) // Add horizontal padding
    }
}
