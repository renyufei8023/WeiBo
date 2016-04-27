//
//  PopverPresentationController.swift
//  weibo
//
//  Created by 任玉飞 on 16/4/27.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

import UIKit

class PopverPresentationController: UIPresentationController {
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        
    }

    
    override func containerViewWillLayoutSubviews() {
        presentedView()?.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
        containerView?.insertSubview(converView, atIndex: 0)
        
    }
    
    private lazy var converView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        view.frame = UIScreen.mainScreen().bounds
        let tap = UITapGestureRecognizer(target: self, action: "close")
        view.addGestureRecognizer(tap)
        return view
    }()
    
    func close() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
