//
//  PlatesApp.swift
//  Plates
//
//  Created by Madison L.H. Wass on 6/11/24.
//

import SwiftData
import SwiftUI

@main
struct PlatesApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Base.self,
            Plate.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
