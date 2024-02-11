//
//  User.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import Foundation

struct User: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let email: String
    let gender: Gender
    let status: Status
    
    var initials: String {
        let initials = name.split(separator: " ").compactMap { $0.first }
        return String(initials).uppercased()
    }
}

extension User {
    
    enum Status: String, Codable, CaseIterable {
        case active, inactive
    }
    
    enum Gender: String, Codable, CaseIterable {
        case male, female
    }
}
