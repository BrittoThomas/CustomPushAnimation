//
//  PopDismissAnimationController.swift
//  CittaDoctor.ai
//
//  Created by UVIONICS on 09/02/18.
//  Copyright © 2018 Citta.ai. All rights reserved.
//

import UIKit

class PopDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from),
            let toViewController = transitionContext.viewController(forKey: .to),
            let snapshot = fromViewController.view.snapshotView(afterScreenUpdates: false)
            else {
                return
        }
        
        let containerView = transitionContext.containerView
        containerView.insertSubview(toViewController.view, at: 0)
        containerView.addSubview(snapshot)
        fromViewController.view.isHidden = true

        let duration = transitionDuration(using: transitionContext)
        
        UIView.animateKeyframes(
            withDuration: duration,
            delay: 0,
            options: .calculationModeCubic,
            animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    snapshot.center.x = fromViewController.view.center.x * 3
                }
        },
            completion: { _ in
                fromViewController.view.isHidden = false
                snapshot.removeFromSuperview()
                if transitionContext.transitionWasCancelled {
                    toViewController.view.removeFromSuperview()
                }
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

