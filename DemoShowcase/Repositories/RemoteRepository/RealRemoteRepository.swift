//
//  RealRemoteRepository.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import Foundation

final class RealRemoteRepository: RemoteUserRepository {
    enum Errors: Error {
        case invalidResponse
    }
    
    @Dependency var networkService: any NetworkService
    
    func fetchUsers() async throws -> [User] {
        guard let url = URL(string: "https://gorest.co.in/public/v2/users") else {
            fatalError("Invalid url")
        }
        
        let (data, response) = try await networkService.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
            throw Errors.invalidResponse
        }
        
        let users = try JSONDecoder().decode([User].self, from: data)
        return users
    }
    
}
