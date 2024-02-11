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
                    name: "User\(id)",
                    email: "Email\(id)",
                    gender: Gender.allCases.randomElement()!,
                    status: Status.allCases.randomElement()!)
    }
}
