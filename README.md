OnboardingKit

OnboardingKit provides an onboarding flow that is simple and easy to implement.

## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Credits](#credits)

## Requirements

- iOS 15.0 or later
- Xcode 15.0 or later
- Swift 5.0 or later


## Installation
There are two ways to use OnboardingKit in your project:
- using Swift Package Manager
- manual install (build frameworks or embed Xcode Project)

### Swift Package Manager

To integrate OnboardingKit into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:
https://github.com/jajimentol/OnboardingKit
```swift
dependencies: [
    .package(url: "https://github.com/jajimentol/OnboardingKit", .upToNextMajor(from: "1.0.0"))
]
```

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

### Manually

If you prefer not to use Swift Package Manager, you can integrate OnboardingKit into your project manually.

---

## Usage

An easy setup through a configuration. Set yout slides, define your after onboarding action and you are ready to go!
No need to launch from main-thread, it is automatically presenting itself once it is available.

### Quick Start

```swift
import UIKit
import OnboardingKit

class ViewController: UIViewController {
    
    private var onboardingKit: OnboardingKit?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presentOnboarding()
    }
    
    func presentOnboarding() {
        let slides = [Slide(image: UIImage(named: "imSlide1")!, title: "Personalized Offers at 40,000+ places"),
                      Slide(image: UIImage(named: "imSlide2")!, title: "Stack your rewards every time you pay"),
                      Slide(image: UIImage(named: "imSlide3")!, title: "Enjoy exclusive deals and discounts"),
                      Slide(image: UIImage(named: "imSlide4")!, title: "Earn cashback on every purchase"),
                      Slide(image: UIImage(named: "imSlide5")!, title: "Save and earn with every transaction")
        ]
        
        let config = OnboardingConfiguration(
            content: OnboardingContent(slides: slides, slideDuration: 3, shouldLoop: false),
            buttons: OnboardingButtons(
                onCta: {
                    UIView.animate(withDuration: 0.5) {
                        self.view.backgroundColor = UIColor.red
                    }
                },
                nextButtonTitle: "İleri",
                ctaButtontitle: "Hemen Başla",
                tintColor: UIColor.systemBlue
            ))
        
        
        onboardingKit = OnboardingKit(config: config)
        onboardingKit?.launchOnboarding(root: self)
    }
}


```

## Credits

- Anıl Turan
