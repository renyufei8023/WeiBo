//
//  RYFTabbar.swift
//  weibo
//
//  Created by 任玉飞 on 16/4/25.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

import UIKit

class RYFTabbar: UITabBar {

    private lazy var comBtn:UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Highlighted)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Highlighted)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        btn.addTarget(self, action: #selector(RYFTabbar.plusSignClick), forControlEvents: .TouchUpInside)
        return btn
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        comBtn.bounds = CGRectMake(0, 0, (comBtn.currentBackgroundImage?.size.width)! ,(comBtn.currentBackgroundImage?.size.height)!)
        comBtn.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)
        self.addSubview(comBtn)
        var index = 0
        let buttonY:CGFloat = 0
        let buttonW = self.frame.size.width / 5
        let buttonH = self.frame.size.height
        
        
        for view in self.subviews {
            if view.isKindOfClass(NSClassFromString("UITabBarButton")!) {
                index = ((index > 1) ? (index + 1) : index)
                //MARK: -有bug
                if index == 5 {
                    index = 4
                }
                print(index)
                let buttonX = buttonW * CGFloat(index)
                view.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH)
                index += 1

            }
        }
    }
    
    func plusSignClick() {
        print("heheh")
    }

}
