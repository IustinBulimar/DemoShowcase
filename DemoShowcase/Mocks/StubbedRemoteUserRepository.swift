//
//  StubbedRemoteUserRepository.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import Foundation

final class StubbedRemoteUserRepository: RemoteUserRepository {
    var shouldFail: Bool = false
    
    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }
    
    func fetchUsers() async throws -> [User] {
        if shouldFail {
            throw Errors.generic
        }
        
        return (1...5).map { _ in User.randomMock() }
    }
}
