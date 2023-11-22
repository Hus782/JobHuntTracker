//
//  JobApplicationView.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/20/23.
//

import SwiftUI

struct JobApplicationRow: View {
    var application: JobApplicationEntity
    @State private var isPressed = false
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "briefcase.fill") // Example system icon
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
                .background(statusColor(status: JobStatus(rawValue: application.status) ?? .open))
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(application.jobTitle)
                    .font(.headline)
                Text(application.companyName)
                    .font(.subheadline)
                Text(formatDateToString(application.applicationDate))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(application.status)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(statusColor(status: JobStatus(rawValue: application.status) ?? .open))
                .cornerRadius(8)
        }
        
        .padding() // Add padding to give the card some breathing room
        .background(Color.white) // Set the background of the row to white
        .cornerRadius(10) // Apply corner radius to the row for the card effect
        //                .shadow(radius: 2) // Optional: add a shadow for some depth
        .listRowBackground(Color.clear)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color.white))
        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 4)
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.spring(), value: isPressed)
        //        .onLongPressGesture(minimumDuration: 0.1, pressing: { pressing in
        //            withAnimation(.easeInOut(duration: 0.2)) {
        //                self.isPressed = pressing
        //            }
        //        }, perform: {})
    }
    
    func statusColor(status: JobStatus) -> Color {
        switch status {
        case .interviewing:
            return .blue
        case .applied:
            return .green
        case .closed:
            return .red
        case .open:
            return .orange
        default:
            return .gray
        }
    }
    
    func formatDateToString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }

}
