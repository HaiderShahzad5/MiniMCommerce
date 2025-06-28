# MiniMCommerce iOS App

A minimalist mCommerce app demonstrating product listing, detail view, cart management, and persistent storage using Core Data.

---

## 📲 Features

- Product List from FakeStore API
- Product Detail with Add to Cart
- Cart with quantity control, total calculation
- Persistent cart using Core Data
- MVVM + Combine + SwiftUI + async/await

---

## 🛠 Tech Stack

- Swift
- SwiftUI
- Combine
- Core Data
- async/await (URLSession)
- Xcode 15+

---

## 🧱 Architecture

**MVVM** pattern using:

- `ProductListViewModel` to fetch and expose product list
- `CartManager` as an `ObservableObject` shared via `@EnvironmentObject`
- `NetworkManager` handles API communication

---

## 🧪 Persistence

- Core Data stores cart state with a `CartItemEntity` model
- Data is auto-saved on each cart update
- Restores on app launch

---

## 🚧 Known Issues

- Product descriptions and ratings are not persisted since only selected fields are stored in Core Data
- No authentication or checkout flow implemented

---

## ⏱ Time Taken

~6–8 hours in total:
- 3h for base functionality
- 2h for MVVM refactoring & Combine
- 1h for Core Data
- 1h for polish, testing, and README

---

## 🧪 Testing (Optional)

- No unit tests added — project designed to be testable by injecting mocks
- ViewModels are isolated from views

---

## 📹 Demo Video

> https://drive.google.com/file/d/1c63TrnWdl-VSmvUqRICW7X7jXJp6BgT7/view?usp=sharing

---

## 🧩 Setup Instructions

```bash
git clone https://github.com/HaiderShahzad5/MiniMCommerce.git
cd MiniMCommerce
open MiniMCommerce.xcodeproj
