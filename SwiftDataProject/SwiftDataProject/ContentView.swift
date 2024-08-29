//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Galih Samudra on 29/08/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    @State private var path = [User]()
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button("Add User", systemImage: "plus") {
                        let date = Date.now
                        let user = User(name: "",
                                        city: "",
                                        joinDate: date)
                        modelContext.insert(user)
                        path = [user]
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    
                    Button("Delete", systemImage: "trash") {
                        do {
                            try modelContext.delete(model: User.self)
                        } catch {}
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
