//
//  DataJsonModel.swift
//  ProductApp
//
//  Created by Chandan on 19/04/24.
//

import Foundation

// MARK: - DataJsonModel
struct DataJsonModel: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
