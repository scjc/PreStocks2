//
//  PreStocks2App.swift
//  PreStocks2
//
//  Created by Jeremy Chang on 09/08/2022.
//

import SwiftUI

@main
struct PreStocks2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
