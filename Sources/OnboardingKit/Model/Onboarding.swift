//
//  Onboarding.swift
//  OnboardingKit
//
//  Created by Anil Turan on 18.08.2025.
//

import UIKit

@MainActor
public struct OnboardingConfiguration {
    public var content: OnboardingContent
    public var buttons: OnboardingButtons
    
    public init(content: OnboardingContent, buttons: OnboardingButtons) {
        self.buttons = buttons
        self.content = content
    }
}

@MainActor
public struct OnboardingButtons {
    public var onCta: (() -> Void)?
    public let nextButtonTitle: String
    public let ctaButtontitle: String
    public let tintColor: UIColor
    public init(onCta: (() -> Void)?, nextButtonTitle: String, ctaButtontitle: String, tintColor: UIColor) {
        self.onCta = onCta
        self.nextButtonTitle = nextButtonTitle
        self.ctaButtontitle = ctaButtontitle
        self.tintColor = tintColor
    }
    
    internal var onDismiss: (() -> Void)?
}

@MainActor
public struct OnboardingContent {
    public let slideDuration: Int
    public let slides: [Slide]
    public let shouldLoop: Bool
    public init(slides: [Slide], slideDuration: Int = 3, shouldLoop: Bool = true) {
        self.slideDuration = slideDuration
        self.slides = slides
        self.shouldLoop = shouldLoop
    }
}

@MainActor
extension OnboardingConfiguration {
    internal mutating func setDismiss(_ handler: @escaping () -> Void) {
        self.buttons.onDismiss = handler
    }
}
