//
//  CartManager.swift
//  MiniMCommerce
//
//  Created by Haider Shahzad on 28/06/2025.
//

import Foundation
import SwiftUI
import CoreData

class CartManager: ObservableObject {
    @Published var items: [CartItem] = []

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.context = context
        loadCart()
    }

    func addToCart(product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(product: product, quantity: 1))
        }
        saveToCoreData()
    }

    func removeFromCart(product: Product) {
        items.removeAll { $0.product.id == product.id }
        saveToCoreData()
    }

    func updateQuantity(for product: Product, quantity: Int) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity = quantity
        }
        saveToCoreData()
    }

    var totalPrice: Double {
        items.reduce(0) { $0 + $1.product.price * Double($1.quantity) }
    }

    private func saveToCoreData() {
        // Clear old
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "CartItemEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        _ = try? context.execute(deleteRequest)

        // Save current items
        for item in items {
            let entity = CartItemEntity(context: context)
            entity.id = item.id
            entity.productId = Int64(item.product.id)
            entity.title = item.product.title
            entity.price = item.product.price
            entity.image = item.product.image
            entity.quantity = Int16(item.quantity)
        }

        try? context.save()
    }

    private func loadCart() {
        let request: NSFetchRequest<CartItemEntity> = CartItemEntity.fetchRequest()
        let entities = (try? context.fetch(request)) ?? []

        items = entities.map { entity in
            CartItem(
                product: Product(
                    id: Int(entity.productId),
                    title: entity.title ?? "",
                    price: entity.price,
                    description: "", // can’t persist this unless you add more fields
                    category: "",
                    image: entity.image ?? "",
                    rating: Rating(rate: 0.0, count: 0) // same here
                ),
                quantity: Int(entity.quantity)
            )
        }
    }
}


struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}
