//
//  DemoShowcaseTests.swift
//  DemoShowcaseTests
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import XCTest
@testable import DemoShowcase

final class UserRepositoryTests: XCTestCase {
    
    func testUsersPersistenceWorks() async throws {
        let userRepository = RealUserRepository()
        userRepository.remoteUserRepository = StubbedRemoteUserRepository()
        userRepository.localUserRepository = StubbedLocalUserRepository()
        
        let firstUsers = try await userRepository.fetchUsers()
        let secondUsers = try await userRepository.fetchUsers()
        
        XCTAssertEqual(firstUsers, secondUsers)
    }
    
    func testOfflineModeWorks() async throws {
        let remoteRepo = StubbedRemoteUserRepository(shouldFail: true)
        let localRepo = StubbedLocalUserRepository()
        localRepo.persistedUsers = (1...5).map { _ in User.randomMock() }
        
        let userRepository = RealUserRepository()
        userRepository.remoteUserRepository = remoteRepo
        userRepository.localUserRepository = localRepo
        
        let users = try await userRepository.fetchUsers()
        
        XCTAssertEqual(users, localRepo.persistedUsers)
    }
    
}
