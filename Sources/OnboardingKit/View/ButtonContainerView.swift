//
//  ButtonContainerView.swift
//  OnboardingKit
//
//  Created by Anil Turan on 18.08.2025.
//

import UIKit
import SnapKit

class ButtonContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemPink

    }
    
}
