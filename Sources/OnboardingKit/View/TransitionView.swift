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
            list.append(AnimatedBarView(barColor: self.tintColor,
                                        duration: content.slideDuration))
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
    
    private let content: OnboardingContent
    private lazy var slides = {
        return content.slides
    }()

    private var currentIndex: Int = -1
    
    init(content: OnboardingContent) {
        self.content = content
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
        timer?.schedule(deadline: .now(),
                        repeating: DispatchTimeInterval.seconds(self.content.slideDuration),
                        leeway: .seconds(1))
        timer?.setEventHandler { [weak self] in
            guard let self else { return }
            DispatchQueue.main.async {
                self.showNext()
            }
        }
    }
    
    private func showNext() {
        
        let image: UIImage
        let title: String
        let currrentBarView: AnimatedBarView
        
        if slides.indices.contains(currentIndex + 1) {
            image = slides[currentIndex+1].image
            title = slides[currentIndex+1].title
            currrentBarView = barList[currentIndex + 1]
            currentIndex += 1
        } else {
            if content.shouldLoop {
                image = slides.first!.image
                title = slides.first!.title
                currentIndex = 0
                barList.forEach { bar in
                    bar.resetAnimation()
                }
                currrentBarView = barList[currentIndex]
            } else {
                return
                
            }
        }
        
        UIView.transition(
            with: imageView,
            duration: 0.5,
            options: .transitionCrossDissolve) {
                self.imageView.image = image
                self.titleView.setTitle(title, font: self.content.font)
            }
        
        currrentBarView.startAnimating()
        
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
        
        start()
    }
    
    func handleTap(direction: Direction) {
        switch direction {
        case .left:
            barList[currentIndex].resetAnimation()
            if slides.indices.contains(currentIndex - 1) {
                barList[currentIndex - 1].resetAnimation()
                currentIndex -= 2
            } else {
                barList[currentIndex].resetAnimation()
                currentIndex = -1
            }
        case .right:
            if slides.indices.contains(currentIndex + 1) || content.shouldLoop {
                barList[currentIndex].finishAnimation()
            } else {
                return
            }
        }
        timer?.cancel()
        timer = nil
        start()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
