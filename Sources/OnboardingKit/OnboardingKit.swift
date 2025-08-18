import UIKit


/// The kit that manages the onboarding process in the application.
/// This class is responsible for presenting the onboarding view controller with the provided slides and tint color.
@MainActor
public class OnboardingKit {
    
    /// The slides to be displayed in the onboarding process.
    private let slides: [Slide]
    
    /// The tint color to be used in the top bars.
    private let tintColor: UIColor
    
    private lazy var onboardingViewController: OnboardingViewController = {
        let controller = OnboardingViewController(slides: self.slides,
                                                  tintColor: self.tintColor)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .fullScreen
        return controller
    }()
    
    /// Initializes the OnboardingKit with the provided slides and tint color.
    public init(slides: [Slide], tintColor: UIColor) {
        self.slides = slides
        self.tintColor = tintColor
    }
    
    /// Launches the onboarding process by presenting the onboarding view controller.
    public func launchOnboarding(root: UIViewController) {
        root.present(onboardingViewController, animated: true, completion: nil)
    }
    
    /// Dismisses the onboarding view controller.
    public func dismissOnboarding() {
        
    }
}
