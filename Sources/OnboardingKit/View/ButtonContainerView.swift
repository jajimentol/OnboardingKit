//
//  ButtonContainerView.swift
//  OnboardingKit
//
//  Created by Anil Turan on 18.08.2025.
//

import UIKit
import SnapKit

class ButtonContainerView: UIView {
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.layer.borderColor = tintColor.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(tintColor, for: .normal)
        return button
    }()
    
    private lazy var ctaButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.addTarget(self, action: #selector(ctaButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = tintColor
        button.layer.shadowColor = tintColor.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 8
        button.layer.cornerRadius = 12
        return button
    }()
    
    init(tintColor: UIColor) {
        super.init(frame: .zero)
        self.tintColor = tintColor
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemPink

    }
    
    @objc func nextButtonTapped() {
        
    }
    
    @objc func ctaButtonTapped() {
        
    }
    
}
