//
//  BaseTableViewController.swift
//  weibo
//
//  Created by 任玉飞 on 16/4/25.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    var userLogin = false
    var visitorView: VisitorView?
    
    override func loadView() {
        userLogin ? super.loadView() : setupVisitorView()
    }
    
    private func setupVisitorView() {
        let customView = VisitorView()
        view = customView
        visitorView = customView
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: "registerBtnWillClick")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Plain, target: self, action: "loginBtnWillClick")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func leftBtnClick()  {
        
    }

    //MARK:-导航栏按钮
    func registerBtnWillClick() -> Void {
        
    }
    
    func loginBtnWillClick() -> Void {
        
    }
}
