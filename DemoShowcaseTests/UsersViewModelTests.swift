//
//  UserViewModelTests.swift
//  DemoShowcaseTests
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import XCTest
@testable import DemoShowcase

final class UsersViewModelTests: XCTestCase {
    
    func testUsersAreActive() async {
        Dependencies[UserRepository.self] = StubbedUserRepository()
        let viewModel = UsersViewModel()
        
        await viewModel.fetchData()
        
        let containsInactiveUsers = viewModel.users.contains(where: { $0.status == .inactive })
        
        XCTAssertEqual(containsInactiveUsers, false)
    }
    
}
