//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Galih Samudra on 30/08/24.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User>{ user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)
                Spacer()
                Text(String(user.unwrappedJobs.count))
                    .fontWeight(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background {
                        Color.blue
                    }
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
            
        }
        .onAppear(perform: addSample)
    }
    
    private func addSample() {
        let user1 = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        let job1 = Job(name: "Organize sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)

        modelContext.insert(user1)
        
        user1.jobs?.append(job1)
        user1.jobs?.append(job2)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
