//
//  UserListViewModel.swift
//  UserList
//
//  Created by Eric on 03/11/2025.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var isGridView = false

    let repository = UserListRepository()

    init() {
        fetchUsers()
    }

    func fetchUsers() {
        isLoading = true
        Task {
            do {
                let users = try await repository.fetchUsers(quantity: 20)
                self.users.append(contentsOf: users)
                isLoading = false
            } catch {
                print("Error fetching users: \(error.localizedDescription)")
            }
        }
    }

    func reloadUsers() {
        users.removeAll()
        fetchUsers()
    }
}
