//
//  OnboardingViewController.swift
//  OnboardingKit
//
//  Created by Anil Turan on 18.08.2025.
//

import UIKit
import SnapKit

final class OnboardingViewController: UIViewController {
    
    /// The slides to be displayed in the onboarding process.
    private let slides: [Slide]
    
    /// The tint color to be used in the top bars.
    private let tintColor: UIColor
    
    private lazy var transitionView: TransitionView = {
        let view = TransitionView()
        return view
    }()
    
    private lazy var buttonContainerView: ButtonContainerView = {
        let view = ButtonContainerView(tintColor: self.tintColor)
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [transitionView, buttonContainerView])
        view.axis = .vertical
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(slides: [Slide], tintColor: UIColor) {
        self.slides = slides
        self.tintColor = tintColor
        super.init(nibName: nil, bundle: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        buttonContainerView.snp.makeConstraints { make in
            make.height.equalTo(120)
        }
    }
    
}
