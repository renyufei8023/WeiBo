//
//  RYFViewController.swift
//  weibo
//
//  Created by 任玉飞 on 16/4/25.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

import UIKit

class RYFViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(DiscovTableViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(MessageTableViewController(), title: "我", imageName: "tabbar_profile")
        self.setValue(RYFTabbar(), forKey: "tabBar")

    }
    
    private func addChildViewController(childController: UIViewController ,title:String ,imageName:String) {
        //导航控制器
        let nav = UINavigationController()
        nav.addChildViewController(childController)
        childController.title = title
        //图片
        let image = UIImage(named: imageName)
        let selectImage = UIImage(named: imageName + "_highlighted")
        childController.tabBarItem.title = title
        childController.tabBarItem.image = image
        //文字属性
        let atts = [NSForegroundColorAttributeName:UIColor.orangeColor()]
        childController.tabBarItem.setTitleTextAttributes(atts, forState: .Highlighted)
        childController.tabBarItem.selectedImage = selectImage
        addChildViewController(nav)
    }
}
