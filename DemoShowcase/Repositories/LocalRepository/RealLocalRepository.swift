//
//  RealLocalRepository.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import Foundation
import CoreData

final class RealLocalRepository: LocalUserRepository {
    private let container = NSPersistentContainer(name: "DemoShowcase")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error {
                print(error)
                return
            }
        }
    }
    
    func fetchUsers() -> [User] {
        let request = UserEntity.fetchRequest()
        do {
            return try container.viewContext.fetch(request).compactMap { $0.toUser() }
        } catch {
            print(error)
            return []
        }
    }
    
    func saveUsers(_ users: [User]) {
        _ = users.map { UserEntity(context: container.viewContext, user: $0) }
        do {
            try container.viewContext.save()
        } catch {
            container.viewContext.rollback()
            print(error)
        }
    }
    
}
