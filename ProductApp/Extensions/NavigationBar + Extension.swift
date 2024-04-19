//
//  NavigationBar + Extension.swift
//  ProductApp
//
//  Created by Chandan on 19/04/24.
//

import Foundation
import UIKit

extension UINavigationController {
    func configureNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0) // Set your desired color
        
        self.navigationBar.standardAppearance = navigationBarAppearance
        self.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        self.navigationBar.prefersLargeTitles = true
        
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
}

