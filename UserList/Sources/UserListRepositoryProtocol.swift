//
//  UserListRepositoryProtocol.swift
//  UserList
//
//  Created by Eric on 10/11/2025.
//

import Foundation

protocol UserListRepositoryProtocol {
    func fetchUsers(quantity: Int) async throws -> [User]
}
