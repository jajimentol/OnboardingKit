//
//  AnimatedBarView.swift
//  OnboardingKit
//
//  Created by Anil Turan on 18.08.2025.
//

import UIKit

final class AnimatedBarView: UIView {
    
    private lazy var backgroundBarView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = self.barColor.withAlphaComponent(0.2)
        return view
    }()
    
    private lazy var foregroundBarView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = self.barColor
        view.alpha = 0
        return view
    }()
    
    private let barColor: UIColor
    
    init(barColor: UIColor) {
        self.barColor = barColor
        super.init(frame: .zero)
        setupView()
    }
    
    private func setupView() {
        addSubview(backgroundBarView)
        backgroundBarView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(foregroundBarView)
        foregroundBarView.snp.makeConstraints { make in
            make.edges.equalTo(backgroundBarView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
