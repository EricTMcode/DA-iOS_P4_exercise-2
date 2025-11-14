//
//  UserListViewModel.swift
//  UserList
//
//  Created by Eric on 03/11/2025.
//

import Foundation

@MainActor
class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var isGridView = false
    
    private let repository: UserListRepositoryProtocol
    
    let titleText = "Users"
    
    init(repository: UserListRepositoryProtocol) {
        self.repository = repository
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
        print(users.count)
    }
    
    func shouldLoadMoreData(currentItem item: User) -> Bool {
        guard let lastItem = users.last else { return false }
        return !isLoading && item.id == lastItem.id
    }
}
