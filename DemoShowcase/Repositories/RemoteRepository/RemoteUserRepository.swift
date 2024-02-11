//
//  RemoteUserRepository.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import Foundation

protocol RemoteUserRepository {
    func fetchUsers() async throws -> [User]
}
