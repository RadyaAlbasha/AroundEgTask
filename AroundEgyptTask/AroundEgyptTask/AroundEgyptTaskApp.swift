//
//  AroundEgyptTaskApp.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 24/01/2025.
//

import SwiftUI

@main
struct AroundEgyptTaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
