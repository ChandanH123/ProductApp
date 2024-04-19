//
//  StatusBar + Extension.swift
//  ProductApp
//
//  Created by Chandan on 19/04/24.
//

import Foundation
import UIKit

extension UIApplication {
    func setStatusBarBackgroundColor(color: UIColor) {
        if #available(iOS 13.0, *) {
            let statusBar = UIView(frame: UIApplication.shared.statusBarFrame)
            statusBar.backgroundColor = color
            UIApplication.shared.windows.first?.addSubview(statusBar)
        } else {
            guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
            statusBar.backgroundColor = color
        }
    }
}
