//
//  NetworkService.swift
//  DemoShowcase
//
//  Created by Iustin Bulimar on 11.02.2024.
//

import Foundation

protocol NetworkService {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkService {}
