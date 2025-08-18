//
//  OnboardingViewController.swift
//  OnboardingKit
//
//  Created by Anil Turan on 18.08.2025.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    /// The slides to be displayed in the onboarding process.
    private let slides: [Slide]
    
    /// The tint color to be used in the top bars.
    private let tintColor: UIColor
    
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
        
    }
    
}
