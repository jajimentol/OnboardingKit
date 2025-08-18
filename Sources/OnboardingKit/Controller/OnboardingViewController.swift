//
//  OnboardingViewController.swift
//  OnboardingKit
//
//  Created by Anil Turan on 18.08.2025.
//

import UIKit
import SnapKit

@available(iOS 15.0, *)
final class OnboardingViewController: UIViewController {
    
    private var transitionView: TransitionView
    private var buttonContainerView: ButtonContainerView
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [transitionView, buttonContainerView])
        view.axis = .vertical
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(config: OnboardingConfiguration) {
        self.buttonContainerView = ButtonContainerView(config: config.buttons)
        self.transitionView = TransitionView(content: config.content)
        self.transitionView.tintColor = config.buttons.tintColor
        super.init(nibName: nil, bundle: nil)
        
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .fullScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        transitionView.start()
    }
    
    private func setupViews() {
        
        view.backgroundColor = UIColor.cyan.withAlphaComponent(0.2)
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        buttonContainerView.snp.makeConstraints { make in
            make.height.equalTo(120)
            
        }
    }
    
}
