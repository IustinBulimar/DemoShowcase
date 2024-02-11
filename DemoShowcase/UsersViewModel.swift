//
//  UsersViewModel.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import Foundation

final class UsersViewModel: ObservableObject {
    @Published private(set) var users: [User] = []
    
    @Dependency private var userRepository: any UserRepository
    
    @MainActor
    func fetchData() async {
        do {
            users = try await userRepository.fetchUsers().filter { $0.status == .active }
        } catch {
            print(error)
            users = []
        }
    }
}
