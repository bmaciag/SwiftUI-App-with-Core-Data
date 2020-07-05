//
//  SwiftUIAppWithCoreDataApp.swift
//  SwiftUIAppWithCoreData
//
//  Created by Bartholomäus Maciag on 03.07.20.
//

import SwiftUI

@main
struct SwiftUIAppWithCoreDataApp: App {
    let context = PersistentCloudKitContainer.persistentContainer.viewContext
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, context)
        }
    }
}
