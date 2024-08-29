//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Galih Samudra on 29/08/24.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
