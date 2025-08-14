//
//  gotur_app_frontendApp.swift
//  gotur-app-frontend
//
//  Created by Mine Kırmacı on 14.08.2025.
//

import SwiftUI

@main
struct gotur_app_frontendApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
