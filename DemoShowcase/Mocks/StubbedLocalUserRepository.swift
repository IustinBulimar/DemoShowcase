//
//  StubbedLocalUserRepository.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import Foundation

final class StubbedLocalUserRepository: LocalUserRepository {
    var persistedUsers: [User] = []
    var shouldFail: Bool = false
    
    init(persistedUsers: [User] = [], shouldFail: Bool = false) {
        self.persistedUsers = persistedUsers
        self.shouldFail = shouldFail
    }
    
    func fetchUsers() async throws -> [User] {
        if shouldFail {
            throw Errors.generic
        }
        
        return persistedUsers
    }
    
    func saveUsers(_ users: [User]) async throws {
        if shouldFail {
            throw Errors.generic
        }
        
        persistedUsers.append(contentsOf: users)
    }
}
