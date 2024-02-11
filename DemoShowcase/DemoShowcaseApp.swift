//
//  DemoShowcaseApp.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import SwiftUI

@main
struct DemoShowcaseApp: App {
    
    var body: some Scene {
        WindowGroup {
            UsersListView()
        }
    }
    
    init() {
        insertDependencies()
    }
    
    func insertDependencies() {
        Dependencies[NetworkService.self] = URLSession.shared
        Dependencies[RemoteUserRepository.self] = RealRemoteRepository()
        Dependencies[LocalUserRepository.self] = RealLocalRepository()
        Dependencies[UserRepository.self] = RealUserRepository()
    }
}
