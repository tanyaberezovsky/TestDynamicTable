//
//  UIAplication+Extentions.swift
//  TestDynamicTable
//
//  Created by Tanya Berezovsky on 06/08/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//

import UIKit
extension UIApplication {
    
    static var loginAnimation: UIViewAnimationOptions = .transitionFlipFromRight
    static var logoutAnimation: UIViewAnimationOptions = .transitionCrossDissolve
    
    class func setRootController(_ viewController: UIViewController,
                                 options: UIViewAnimationOptions = .transitionFlipFromRight,
                                 animated: Bool = true,
                                 duration: TimeInterval = 0.5,
                                 completion: (() -> Void)? = nil) {
        
        guard animated else {
            UIApplication.shared.keyWindow?.rootViewController = viewController
            return
        }
        UIView.transition(with: UIApplication.shared.keyWindow!, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            UIApplication.shared.keyWindow?.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }, completion: { _ in
            completion?()
        })
    }
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
