//
//  Slide.swift
//  OnboardingKit
//
//  Created by Anil Turan on 18.08.2025.
//

import UIKit

/// Represents a single slide in the onboarding process.
public struct Slide {
    /// The image to be displayed on the slide.
    public let image: UIImage
    
    /// The title of the slide.
    public let title: String
    
    /// Initializes a new slide with the specified image and title.
    public init(image: UIImage, title: String) {
        self.image = image
        self.title = title
    }
}
