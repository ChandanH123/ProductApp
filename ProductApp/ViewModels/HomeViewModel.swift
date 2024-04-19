//
//  HomeViewModel.swift
//  ProductApp
//
//  Created by Chandan on 19/04/24.
//

import Foundation

class HomeViewModel {
    var products: [Product] = []
    
    func fetchProducts() {
        NetworkManager.shared.fetchProducts(limit: 10, skip: 10) { result in
            switch result {
            case .success(let data):
                debugPrint(data.products)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
