//
//  UserEntity.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import Foundation
import CoreData

extension UserEntity {
    func toUser() -> User? {
        guard let name, let email,
              let gender = User.Gender(rawValue: gender ?? ""), let status,
              let status = User.Status(rawValue: status) else { return nil }
        
        return User(id: Int(id), name: name, email: email, gender: gender, status: status)
    }
    
    convenience init(context moc: NSManagedObjectContext, user: User) {
        self.init(context: moc)
        id = Int32(user.id)
        name = user.name
        email = user.email
        gender = user.gender.rawValue
        status = user.status.rawValue
    }
}
