//
//  ButtonContainerView.swift
//  OnboardingKit
//
//  Created by Anil Turan on 18.08.2025.
//

import UIKit
import SnapKit

@available(iOS 15.0, *)
class ButtonContainerView: UIView {
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.bordered(),
                              primaryAction: UIAction { [weak self] _ in
            self?.nextButtonTapped()
        })
        button.setTitle("Next", for: .normal)
        button.layer.borderColor = tintColor.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(tintColor, for: .normal)
        return button
    }()
    
    private lazy var ctaButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.filled(),
                              primaryAction: UIAction { [weak self] _ in
            self?.ctaButtonTapped()
        })
        button.setTitle("Get Started", for: .normal)
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
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nextButton, ctaButton])
        view.axis = .horizontal
        view.spacing = 16
        return view
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
        
        backgroundColor = .white
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 24, left: 24, bottom: 36, right: 24))
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalTo(ctaButton.snp.width).multipliedBy(0.5)
        }
    }
    
    func nextButtonTapped() {
        
    }
    
    func ctaButtonTapped() {
        
    }
    
}
