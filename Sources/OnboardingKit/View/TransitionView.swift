//
//  TransitionView.swift
//  OnboardingKit
//
//  Created by Anil Turan on 18.08.2025.
//

import UIKit

class TransitionView: UIView {
    
    private var timer: DispatchSourceTimer?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = . yellow
        return imageView
    }()
    
    private lazy var barList: [AnimatedBarView] = {
        var list: [AnimatedBarView] = []
        slides.forEach { _ in
            list.append(AnimatedBarView())
        }
        return list
    }()
    
    private lazy var barStackView: UIStackView = {
        let stackView = UIStackView()
        barList.forEach { stackView.addArrangedSubview($0) }
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var titleView: TitleView = {
        let view = TitleView()
        return view
    }()
    
    private lazy var container: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView , titleView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
        
    
    private let slides: [Slide]
    private var currentIndex: Int = -1
    
    init(content: OnboardingContent) {
        self.slides = content.slides
        super.init(frame: .zero)
        setupView()
    }
    
    func start() {
        buildTimerIfNeeded()
        timer?.resume()
    }
    
    func stop() {
        timer?.cancel()
        timer = nil
    }
    
    private func buildTimerIfNeeded() {
        guard timer == nil else { return }
        timer = DispatchSource.makeTimerSource(queue: .main)
        timer?.schedule(deadline: .now(), repeating: 3, leeway: .seconds(1))
        timer?.setEventHandler { [weak self] in
            guard let self else { return }
            DispatchQueue.main.async {
                self.showNext()
            }
        }
    }
    
    private func showNext() {
        
        let image: UIImage
        
        if slides.indices.contains(currentIndex + 1) {
            image = slides[currentIndex+1].image
            currentIndex += 1
        } else {
            image = slides.first!.image
            currentIndex = 0
        }
        
        UIView.transition(
            with: imageView,
            duration: 0.5,
            options: .transitionCrossDissolve) {
                self.imageView.image = image
            }
        
    }
    
    private func setupView() {
        
        addSubview(container)
        addSubview(barStackView)
        
        container.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        barStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.top.equalTo(self.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(4)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(container.snp.height).multipliedBy(0.8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
