//
//  AnimatedBarView.swift
//  OnboardingKit
//
//  Created by Anil Turan on 18.08.2025.
//

import UIKit
import Combine

final class AnimatedBarView: UIView {
    
    enum State {
        case clear
        case animating
        case filled
    }
    
    private lazy var backgroundBarView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 2 
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
    
    @Published private var state: State = .clear
    private var subscribers = Set<AnyCancellable>()
    private var animator: UIViewPropertyAnimator!
    private let barColor: UIColor
    private let duration: Int
    
    init(barColor: UIColor, duration: Int) {
        self.duration = duration
        self.barColor = barColor
        super.init(frame: .zero)
        setupView()
        observe()
    }
    
    private func setupView() {
        addSubview(backgroundBarView)
        backgroundBarView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundBarView.addSubview(foregroundBarView)
        foregroundBarView.snp.makeConstraints { make in
            make.edges.equalTo(backgroundBarView)
        }
    }
    
    private func setupAnimator() {
        animator = UIViewPropertyAnimator(
            duration: TimeInterval(self.duration),
            curve: .easeInOut, animations: {
                self.foregroundBarView.transform = .identity
            })
    }
    
    private func observe() {
        $state
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] state in
            switch state {
            case .clear:
                setupAnimator()
                foregroundBarView.alpha = 0
                animator.stopAnimation(true)
            case .animating:
                foregroundBarView.transform = .init(translationX: -bounds.width, y: 0)
                foregroundBarView.alpha = 1
                animator.startAnimation()
            case .filled:
                animator.stopAnimation(true)
                foregroundBarView.transform = .identity
            }
        }.store(in: &subscribers)
    }
    
    func startAnimating() {
        state = .animating
    }
    
    func resetAnimation() {
        state = .clear
    }
    
    func finishAnimation() {
        state = .filled
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
