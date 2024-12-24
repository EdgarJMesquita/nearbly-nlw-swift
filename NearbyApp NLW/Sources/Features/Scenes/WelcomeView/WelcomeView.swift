//
//  WelcomeView.swift
//  NearbyApp NLW
//
//  Created by Edgar Mesquita on 11/12/24.
//

import Foundation
import UIKit

class WelcomeView: UIView {
    
    var didTapButton: (() -> Void?)?
    
    private let logoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Boas Vindas ao Nearby!"
        label.font = Typography.titleXL
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Tenha cupoins de vantagens para usar em seus estabelecimentos favoritos"
        label.font = Typography.textMD
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subTextForTips: UILabel = {
        let label = UILabel()
        
        label.text = "Veja como funciona:"
        label.font = Typography.textMD
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tipsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 24
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar", for: .normal)
        button.backgroundColor = Colors.greenBase
        button.setTitleColor(Colors.gray100, for: .normal)
        button.titleLabel?.font = Typography.action
        button.layer.cornerRadius = 8
        
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        setupTips()
        self.addSubview(logoImageView)
        self.addSubview(welcomeLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(subTextForTips)
        self.addSubview(tipsStackView)
        self.addSubview(startButton)
        setupContraints()
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            subTextForTips.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            subTextForTips.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            tipsStackView.topAnchor.constraint(equalTo: subTextForTips.bottomAnchor, constant: 24),
            tipsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            tipsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            startButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
            startButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            startButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            startButton.heightAnchor.constraint(equalToConstant: 56),
            
            
        ])
    }
    
    private func setupTips() {
  
//        if let mapIcon = UIImage(named: "mapIcon") {
//            let tip1 = TipsView(
//                icon: mapIcon,
//                title: "Encontre estabelecimentos",
//                description: "Veja locais perto de você que são parceiros Nearby")
//            
//        }
//        
        let tip1 = TipsView(
           icon: UIImage(named: "mapIcon")!,
           title: "Encontre estabelecimentos",
           description: "Veja locais perto de você que são parceiros Nearby")
        
        let tip2 = TipsView(
            icon: UIImage(named: "qrcode") ?? UIImage(),
            title: "Ative o cupom com QR Code",
            description: "Escaneie o código no estabelecimento para usar o benefício")
        
        
        guard let ticketIcon = UIImage(named: "ticket") else { return }
        
        let tip3 = TipsView(
            icon: ticketIcon,
            title: "Garanta vantagens perto de você",
            description: "Ative cunpons onde estiver, em diferentes tipos de estabelecimentos")
        
        tipsStackView.addArrangedSubview(tip1)
        tipsStackView.addArrangedSubview(tip2)
        tipsStackView.addArrangedSubview(tip3)

        
    }
    
    @objc private func didTap(){
        didTapButton?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


