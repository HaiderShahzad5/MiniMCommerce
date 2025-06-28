//
//  ProductListViewModel.swift
//  MiniMCommerce
//
//  Created by Haider Shahzad on 28/06/2025.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var error: String?

    func loadProducts() {
        Task {
            isLoading = true
            do {
                products = try await NetworkManager.shared.fetchProducts()
            } catch {
                self.error = error.localizedDescription
            }
            isLoading = false
        }
    }
}
