//
//  TransitionView.swift
//  OnboardingKit
//
//  Created by Anil Turan on 18.08.2025.
//

import UIKit

class TransitionView: UIView {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var barView: [AnimatedBarView] = {
        var list: [AnimatedBarView] = []
        slides.forEach { _ in
            list.append(AnimatedBarView())
        }
        return list
    }()
    
    private lazy var barStackView: UIStackView = {
        let stackView = UIStackView()
        barView.forEach { stackView.addArrangedSubview($0) }
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    private let slides: [Slide]
    
    init(content: OnboardingContent) {
        self.slides = content.slides
        super.init(frame: .zero)
        setupView()
    }
    
    private func setupView() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
