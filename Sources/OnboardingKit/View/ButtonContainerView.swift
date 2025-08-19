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
    
    var nextButtonDidTap: (() -> Void)?
    
    private var config: OnboardingButtons
    
    private lazy var nextButton: UIButton = {
        
        let font = config.buttonFont
        let container = AttributeContainer([NSAttributedString.Key.font: font])
        let attribString = AttributedString(config.nextButtonTitle, attributes: container)
        var config = UIButton.Configuration.bordered()
        config.attributedTitle = attribString
        
        let button = UIButton(configuration: config,
                              primaryAction: UIAction { [weak self] _ in
            self?.nextButtonTapped()
        })
        button.layer.borderColor = tintColor.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 12
        button.setTitleColor(tintColor, for: .normal)
        return button
    }()
    
    private lazy var ctaButton: UIButton = {
        
        let font = config.buttonFont
        let container = AttributeContainer([NSAttributedString.Key.font: font])
        let attribString = AttributedString(config.ctaButtonTitle, attributes: container)
        var config = UIButton.Configuration.filled()
        config.attributedTitle = attribString
        
        let button = UIButton(configuration: config,
                              primaryAction: UIAction { [weak self] _ in
            self?.ctaButtonTapped()
        })

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
    
    init(config: OnboardingButtons) {
        self.config = config
        super.init(frame: .zero)
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
        nextButtonDidTap?()
    }
    
    func ctaButtonTapped() {
        config.onDismiss?()
        config.onCta?()
    }
    
}
