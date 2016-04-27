//
//  PopoverAnimator.swift
//  weibo
//
//  Created by 任玉飞 on 16/4/27.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

import UIKit

class PopoverAnimator: NSObject, UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {

    var isPresent:Bool = false
    
    // 实现代理方法, 告诉系统谁来负责转场动画
    // UIPresentationController iOS8推出的专门用于负责转场动画的
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return PopverPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    // MARK: - 只要实现了一下方法, 那么系统自带的默认动画就没有了, "所有"东西都需要程序员自己来实现
    /**
     告诉系统谁来负责Modal的展现动画
     
     :param: presented  被展现视图
     :param: presenting 发起的视图
     :returns: 谁来负责
     */
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        return self
    }
    /**
     告诉系统谁来负责Modal的消失动画
     
     :param: dismissed 被关闭的视图
     
     :returns: 谁来负责
     */
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        return self
    }
    // MARK: - UIViewControllerAnimatedTransitioning
    /**
     返回动画时长
     
     :param: transitionContext 上下文, 里面保存了动画需要的所有参数
     
     :returns: 动画时长
     */

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    /**
     告诉系统如何动画, 无论是展现还是消失都会调用这个方法
     
     :param: transitionContext 上下文, 里面保存了动画需要的所有参数
     */
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
            toView?.transform = CGAffineTransformMakeScale(1.0, 0.0)
            // 注意: 一定要将视图添加到容器上
            transitionContext.containerView()?.addSubview(toView!)
            
            toView?.layer.anchorPoint = CGPointMake(0.5, 0)
            
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { 
                toView?.transform = CGAffineTransformIdentity
                }, completion: { (_) in
                    // 如果不写, 可能导致一些未知错误
                    transitionContext.completeTransition(true)
            })
            
        }else{
            let  fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { 
                 fromView?.transform = CGAffineTransformMakeScale(1.0, 0.0001)
                }, completion: { (_) in
                    transitionContext.completeTransition(true)
            })
            
        }
    }
    
    
}
