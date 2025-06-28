//
//  Product.swift
//  MiniMCommerce
//
//  Created by Haider Shahzad on 28/06/2025.
//


struct Product: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}
