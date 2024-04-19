//
//  ViewController.swift
//  ProductApp
//
//  Created by Chandan on 18/04/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - ViewModel initialization.
    lazy private var viewModel = HomeViewModel()
    
    //MARK: - View controller life cycle methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        self.viewModel.fetchProducts()
        
    }
}

