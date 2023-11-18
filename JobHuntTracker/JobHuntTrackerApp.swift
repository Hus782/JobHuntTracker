//
//  JobHuntTrackerApp.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/14/23.
//

import SwiftUI

@main
struct JobHuntTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            JobApplicationsListView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
