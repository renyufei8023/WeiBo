//
//  VisitorView.swift
//  weibo
//
//  Created by 任玉飞 on 16/4/25.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

import UIKit
import SnapKit

class VisitorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconView)
        addSubview(homeIcon)
        addSubview(messageLabel)
        addSubview(loginBtn)
        addSubview(registerBtn)
        
        iconView.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var iconView: UIImageView = {
       let iconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return iconView
    }()
    
    private lazy var homeIcon: UIImageView = {
       let homeIcon = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return homeIcon
    }()
    
    private lazy var messageLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.darkGrayColor()
        return label
    }()
    
    private lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("登陆", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
                btn.addTarget(self, action: "loginBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
    
    private lazy var registerBtn: UIButton = {
       let btn = UIButton()
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        btn.setTitle("注册", forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        
        btn.addTarget(self, action: "registerBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
    
    func loginBtnClick() {
        
    }
    
}
