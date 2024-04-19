//
//  HomeViewModel.swift
//  ProductApp
//
//  Created by Chandan on 19/04/24.
//

import UIKit

class HomeViewModel {
    var products: [Product] = []
    
    func fetchProducts(completion: @escaping (Result<Void, Error>) -> Void) {
        NetworkManager.shared.fetchProducts(limit: 10, skip: 10) { result in
            switch result {
            case .success(let data):
                self.products = data.products
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getRowCount() -> Int {
        return products.count
    }
    
    func getRowHeight() -> CGFloat {
        return 120
    }
    
    func getProduct(at index: Int) -> Product? {
        guard index < products.count else { return nil }
        return products[index]
    }
}
