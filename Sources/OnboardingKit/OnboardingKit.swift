import UIKit

/// The kit that manages the onboarding process in the application.
@available(iOS 15.0, *)
@MainActor
public class OnboardingKit {
    
    private var onboardingViewController: OnboardingViewController?
    
    /// Initializes the OnboardingKit with the provided slides and tint color.
    public init(config: OnboardingConfiguration) {
        
        var cfg = config
        cfg.setDismiss {
            self.dismissOnboarding()
        }
        onboardingViewController = OnboardingViewController(config: cfg)
    }
    
    /// Launches the onboarding process by presenting the onboarding view controller.
    public func launchOnboarding(root: UIViewController) {
        guard let onboardingViewController else {
            print("OnboardingViewController is not initialized.")
            return
        }
        
        Task {
            await root.waitUntilVisible()
            root.present(onboardingViewController, animated: true, completion: nil)
        }
    }
    
    /// Dismisses the onboarding view controller.
    public func dismissOnboarding() {
        guard let onboardingViewController else {
            print("OnboardingViewController is not available to dismiss.")
            return
        }
        onboardingViewController.dismiss(animated: true, completion: nil)
    }
}
