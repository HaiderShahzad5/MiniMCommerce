//
//  CartView.swift
//  MiniMCommerce
//
//  Created by Haider Shahzad on 28/06/2025.
//

import Foundation
import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        VStack {
            if cartManager.items.isEmpty {
                Text("Your cart is empty")
                    .font(.headline)
                    .padding()
            } else {
                List {
                    ForEach(cartManager.items) { item in
                        HStack {
                            AsyncImage(url: URL(string: item.product.image)) { image in
                                image.resizable()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)

                            VStack(alignment: .leading) {
                                Text(item.product.title)
                                    .font(.headline)
                                Text("$\(item.product.price, specifier: "%.2f") x \(item.quantity)")
                            }

                            Spacer()

                            Stepper("", value: Binding(
                                get: { item.quantity },
                                set: { newQty in
                                    cartManager.updateQuantity(for: item.product, quantity: newQty)
                                }
                            ), in: 1...10)
                            .labelsHidden()
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { i in
                            let item = cartManager.items[i]
                            cartManager.removeFromCart(product: item.product)
                        }
                    }
                }

                Text("Total: $\(cartManager.totalPrice, specifier: "%.2f")")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
            }
        }
        .navigationTitle("Cart")
    }
}
