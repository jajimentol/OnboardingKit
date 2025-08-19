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
    public let ctaButtonTitle: String
    public let tintColor: UIColor
    public let buttonFont: UIFont
    public init(onCta: (() -> Void)?,
                nextButtonTitle: String,
                ctaButtonTitle: String,
                tintColor: UIColor,
                buttonFont: UIFont = UIFont.boldSystemFont(ofSize: 16)) {
        self.onCta = onCta
        self.nextButtonTitle = nextButtonTitle
        self.ctaButtonTitle = ctaButtonTitle
        self.tintColor = tintColor
        self.buttonFont = buttonFont
    }
    
    internal var onDismiss: (() -> Void)?
}

@MainActor
public struct OnboardingContent {
    public let slideDuration: Int
    public let slides: [Slide]
    public let shouldLoop: Bool
    public let font: UIFont
    public init(slides: [Slide],
                slideDuration: Int = 3,
                shouldLoop: Bool = true,
                font: UIFont = UIFont.boldSystemFont(ofSize: 16)) {
        self.slideDuration = slideDuration
        self.slides = slides
        self.shouldLoop = shouldLoop
        self.font = font
    }
}

@MainActor
extension OnboardingConfiguration {
    internal mutating func setDismiss(_ handler: @escaping () -> Void) {
        self.buttons.onDismiss = handler
    }
}
