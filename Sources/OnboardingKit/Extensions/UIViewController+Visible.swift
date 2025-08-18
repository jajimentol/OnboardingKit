//
//  UIViewController+Visible.swift
//  OnboardingKit
//
//  Created by Anil Turan on 18.08.2025.
//

import UIKit

@MainActor
extension UIViewController {
    func waitUntilVisible() async {
        // Already visible?
        if viewIfLoaded?.window != nil { return }

        // Suspend until viewDidAppear via a child probe
        await withCheckedContinuation { (continuation: CheckedContinuation<Void, Never>) in
            let probe = _AppearanceProbe {
                continuation.resume()
            }
            self.addChild(probe)
            self.view.addSubview(probe.view)
            probe.didMove(toParent: self)
        }
    }
}

@MainActor
private final class _AppearanceProbe: UIViewController {
    private let onAppear: () -> Void
    init(onAppear: @escaping () -> Void) {
        self.onAppear = onAppear
        super.init(nibName: nil, bundle: nil)
        view.isHidden = true // invisible helper
    }
    required init?(coder: NSCoder) { fatalError() }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        onAppear()
        // Clean up
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
