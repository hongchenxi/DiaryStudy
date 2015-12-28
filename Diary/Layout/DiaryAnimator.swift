//
//  DiaryAnimator.swift
//  Diary
//
//  Created by cx on 15/12/28.
//  Copyright © 2015年 cx. All rights reserved.
//

import UIKit

class DiaryAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    var operation: UINavigationControllerOperation!
    
    // 转场时长
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView()
        
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let fromView = fromVC!.view
        
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let toView = toVC!.view
        
        toView.alpha = 0.0
        
        if operation == UINavigationControllerOperation.Pop {
            toView.transform = CGAffineTransformMakeScale(1.0, 1.0)
        }else{
            toView.transform = CGAffineTransformMakeScale(0.3, 0.3)
        }
        
        containerView!.insertSubview(toView, aboveSubview: fromView)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            if self.operation == UINavigationControllerOperation.Pop {
                fromView.transform = CGAffineTransformMakeScale(3.3, 3.3)
            }else{
                toView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }
            toView.alpha = 1.0
            }, completion: { finished in
                transitionContext.completeTransition(true)

            })
        
    }
    
    
    
}
