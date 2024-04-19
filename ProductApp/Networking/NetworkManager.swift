//
//  NetworkManager.swift
//  ProductApp
//
//  Created by Chandan on 19/04/24.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case dataError
    case parseError
}


class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {} //private init() method is used in this context to implement the singleton pattern and provide a single shared instance of the NetworkManager class.
    
    func fetchProducts(limit: Int, skip: Int, completion: @escaping (Result<DataJsonModel, NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://dummyjson.com/products/?limit=\(limit)&skip=\(skip)") else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.dataError))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(DataJsonModel.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.parseError))
            }
        }.resume()
    }
}
