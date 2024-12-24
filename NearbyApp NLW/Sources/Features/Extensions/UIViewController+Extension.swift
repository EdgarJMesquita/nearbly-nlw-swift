//
//  UIViewController+extension.swift
//  NearbyApp NLW
//
//  Created by Edgar Mesquita on 11/12/24.
//

import Foundation
import UIKit

extension UIViewController {
    public func setupContentViewToViewController(contentView:UIView) {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
 
        ])
    }
}
