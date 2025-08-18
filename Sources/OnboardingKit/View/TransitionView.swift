//
//  TransitionView.swift
//  OnboardingKit
//
//  Created by Anil Turan on 18.08.2025.
//

import UIKit

class TransitionView: UIView {
    
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
