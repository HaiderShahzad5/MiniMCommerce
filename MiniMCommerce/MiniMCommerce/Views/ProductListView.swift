//
//  ProductListView.swift
//  MiniMCommerce
//
//  Created by Haider Shahzad on 28/06/2025.
//
import Foundation
import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductListViewModel()
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    HStack {
                        AsyncImage(url: URL(string: product.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)

                        VStack(alignment: .leading) {
                            Text(product.title)
                                .font(.headline)
                            Text("$\(product.price, specifier: "%.2f")")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .toolbar {
                NavigationLink(destination: CartView()) {
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "cart")
                            .font(.title2)

                        if cartManager.items.count > 0 {
                            Text("\(cartManager.items.count)")
                                .font(.caption2)
                                .foregroundColor(.white)
                                .padding(4)
                                .background(Color.red)
                                .clipShape(Circle())
                                .offset(x: 8, y: -10)
                        }
                    }
                }
            }
            .navigationTitle("Products")
            .onAppear {
                viewModel.loadProducts()
            }
        }
    }
}
