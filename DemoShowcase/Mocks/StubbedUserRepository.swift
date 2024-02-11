//
//  StubbedUserRepository.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import Foundation

final class StubbedUserRepository: UserRepository {
    var shouldFail: Bool = false
    
    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }
    
    func fetchUsers() async throws -> [User] {
        if shouldFail {
            throw Errors.generic
        }
        
        var users = (1...5).map { _ in User.randomMock() }
        users.append(User.createMock(id: 10, status: .inactive))
        users.append(User.createMock(id: 20, status: .inactive))
        return users
    }
    
    func saveUsers(_ users: [User]) async throws {
    
    }
    
}
