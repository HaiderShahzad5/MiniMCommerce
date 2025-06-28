//
//  MiniMCommerceApp.swift
//  MiniMCommerce
//
//  Created by Haider Shahzad on 28/06/2025.
//

import SwiftUI

@main
struct MiniMCommerceApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ProductListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(CartManager(context: persistenceController.container.viewContext))
        }
    }
}
