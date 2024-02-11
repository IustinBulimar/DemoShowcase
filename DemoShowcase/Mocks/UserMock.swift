//
//  UserMock.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import Foundation

extension User {
    static func randomMock() -> User {
        let id = Int.random(in: 100...200)
        return User(id: id,
                    name: "User Nr\(id)",
                    email: "Email\(id)",
                    gender: Gender.allCases.randomElement()!,
                    status: Status.allCases.randomElement()!)
    }
    
    static func createMock(id: Int) -> User {
        return User(id: id,
                    name: "User NRr\(id)",
                    email: "Email\(id)",
                    gender: .male,
                    status: .active)
    }
}
