//
//  ContentView.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import SwiftUI

struct UsersListView: View {
    @StateObject var viewModel = UsersViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section("CONTACTELE MELE") {
                    ForEach(viewModel.users) { user in
                        NavigationLink {
                            Text("Details")
                        } label: {
                            userView(for: user)
                        }
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Contacte")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "person.fill.badge.plus")
                    }
                    .buttonStyle(.bordered)
                    .tint(.white)
                    .foregroundStyle(.gray)
                }
            }
            .task {
                await viewModel.fetchData()
            }
        }
    }
    
    func userView(for user: User) -> some View {
        HStack {
            Group {
                if user.id % 2 == 0  {
                    ZStack {
                        Color.gray
                        
                        Text(user.initials)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                } else {
                    AsyncImage(url: URL(string: "https://picsum.photos/200/200")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        
                    }
                }
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            
            Text(user.name)
        }
        .padding(8)
    }
}

#Preview {
    Dependencies[RemoteUserRepository.self] = StubbedRemoteUserRepository()
    Dependencies[LocalUserRepository.self] = StubbedLocalUserRepository()
    Dependencies[UserRepository.self] = RealUserRepository()
    return UsersListView()
}
