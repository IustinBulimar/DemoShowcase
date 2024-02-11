//
//  UserRepository.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import Foundation

protocol UserRepository {
    func fetchUsers() async throws -> [User]
    func saveUsers(_ users: [User]) async throws
}
