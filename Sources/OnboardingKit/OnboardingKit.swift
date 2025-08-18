import UIKit

@MainActor
public class OnboardingKit {
    
    public init() {}
    
    private var onboardingViewController: OnboardingViewController = {
        let controller = OnboardingViewController()
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .fullScreen
        return controller
    }()
    
    public func launchOnboarding(root: UIViewController) {
        root.present(onboardingViewController, animated: true, completion: nil)
    }
    
    public func dismissOnboarding() {
        
    }
}
