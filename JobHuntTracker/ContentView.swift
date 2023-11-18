//
//  ContentView.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/14/23.
//

import SwiftUI
import CoreData

struct JobApplication: Identifiable {
    var id = UUID()
    var companyName: String
    var jobTitle: String
    var applicationDate: String
    var status: String
    var logoName: String // Placeholder for logo image name
}


struct JobApplicationsListView: View {
    let applications: [JobApplication] = [
        // Sample data
        .init(companyName: "Company A", jobTitle: "Software Engineer", applicationDate: "Jan 1, 2023", status: "Applied", logoName: "logo1"),
        .init(companyName: "Company B", jobTitle: "Product Manager", applicationDate: "Feb 15, 2023", status: "Interviewing", logoName: "logo2"),
        // Add more applications here
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                // Upper element view
                ProfileOverviewView(userName: "Azuki", userTitle: "Future iOS Engineer", applicationsThisMonth: 5, monthlyTarget: 10)
                    .padding(.horizontal)
                
                TopStatusView()
                
//                Spacer()
                
                
                // List of job applications
                List(applications) { application in
                    JobApplicationRow(application: application)
                        .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
                .background(Color.orange) // Set your desired color here
                                .cornerRadius(20)
                                .edgesIgnoringSafeArea(.bottom)
                                .padding(.top, -20)
                
                
            }
            .navigationBarTitle("Job Applications", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {}) {
                    Image(systemName: "line.horizontal.3.decrease.circle.fill")
                },
                trailing: Button(action: {}) {
                    Image(systemName: "plus.circle.fill")
                }
            )
        }
        .background(Color.white)
    }
}

struct JobApplicationRow: View {
    var application: JobApplication
    @State private var isPressed = false
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "briefcase.fill") // Example system icon
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
                .background(statusColor(status: application.status))
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(application.jobTitle)
                    .font(.headline)
                Text(application.companyName)
                    .font(.subheadline)
                Text(application.applicationDate)
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
                .background(statusColor(status: application.status))
                .cornerRadius(8)
        }
        
        .padding() // Add padding to give the card some breathing room
                .background(Color.white) // Set the background of the row to white
                .cornerRadius(10) // Apply corner radius to the row for the card effect
//                .shadow(radius: 2) // Optional: add a shadow for some depth
                .listRowBackground(Color.clear)        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 4)
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.spring(), value: isPressed)
        .onLongPressGesture(minimumDuration: 0.1, pressing: { pressing in
            withAnimation(.easeInOut(duration: 0.2)) {
                self.isPressed = pressing
            }
        }, perform: {})
    }
    
    func statusColor(status: String) -> Color {
        switch status {
        case "Interviewing":
            return .blue
        case "Applied":
            return .green
        default:
            return .gray
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        JobApplicationsListView()
    }}

//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>

//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
//    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}

//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()



