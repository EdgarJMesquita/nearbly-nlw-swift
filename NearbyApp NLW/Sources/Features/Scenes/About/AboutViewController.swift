//
//  AboutViewController.swift
//  NearbyApp NLW
//
//  Created by Edgar Mesquita on 13/12/24.
//

import Foundation
import UIKit

class AboutViewController: UIViewController {
    let contentView: AboutView
    
    init(contentView: AboutView){
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        view.addSubview(contentView)
        view.backgroundColor = Colors.gray100
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.setupContentViewToViewController(contentView: contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
