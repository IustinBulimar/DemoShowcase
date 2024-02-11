//
//  RealUserRepository.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import Foundation

final class RealUserRepository: UserRepository {
    @Dependency var remoteUserRepository: any RemoteUserRepository
    @Dependency var localUserRepository: any LocalUserRepository
    
    func fetchUsers() async throws -> [User] {
        let cachedUsers = try await localUserRepository.fetchUsers()
        if !cachedUsers.isEmpty {
            return cachedUsers
        }
        
        let users = try await remoteUserRepository.fetchUsers()
        try await saveUsers(users)
        return users
    }
    
    func saveUsers(_ users: [User]) async throws {
        try await localUserRepository.saveUsers(users)
    }
}
