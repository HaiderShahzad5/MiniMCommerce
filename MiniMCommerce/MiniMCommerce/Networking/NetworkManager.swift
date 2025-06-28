//
//  NetworkManager.swift
//  MiniMCommerce
//
//  Created by Haider Shahzad on 28/06/2025.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Product].self, from: data)
    }
}
