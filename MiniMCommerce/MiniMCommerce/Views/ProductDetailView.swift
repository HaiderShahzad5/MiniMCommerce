//
//  ProductDetailView.swift
//  MiniMCommerce
//
//  Created by Haider Shahzad on 28/06/2025.
//

import Foundation
import SwiftUI

struct ProductDetailView: View {
    let product: Product

    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 300)
                } placeholder: {
                    ProgressView()
                }

                Text(product.title)
                    .font(.title)
                    .fontWeight(.bold)

                Text(product.category.capitalized)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(String(format: "$%.2f", product.price))
                    .font(.title2)
                    .fontWeight(.semibold)

                Text(product.description)
                    .font(.body)

                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(product.rating.rate, specifier: "%.1f") (\(product.rating.count) reviews)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Button(action: {
                    cartManager.addToCart(product: product)
                }) {
                    Text("Add to Cart")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 16)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
