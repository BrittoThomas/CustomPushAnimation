//
//  PushPresentAnimationController.swift
//  CittaDoctor.ai
//
//  Created by UVIONICS on 09/02/18.
//  Copyright © 2018 Citta.ai. All rights reserved.
//

import UIKit

class PushPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromViewController = transitionContext.viewController(forKey: .from),
            let toViewController = transitionContext.viewController(forKey: .to),
            let snapshot = toViewController.view.snapshotView(afterScreenUpdates: true)
            else {
                return
        }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toViewController.view)
        containerView.addSubview(snapshot)
        toViewController.view.isHidden = true
        
        snapshot.center.x = fromViewController.view.center.x * 3
        let duration = transitionDuration(using: transitionContext)
        UIView.animateKeyframes(
            withDuration: duration,
            delay: 0,
            options: .calculationModeCubic,
            animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    snapshot.center.x = fromViewController.view.center.x
                }
        },
            completion: { _ in
                toViewController.view.isHidden = false
                snapshot.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

