//
//  VisitorView.swift
//  weibo
//
//  Created by 任玉飞 on 16/4/25.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

import UIKit
import SnapKit

protocol VisitorViewDelegate:NSObjectProtocol {
    func loginBtnWillClick()
    func registerBtnWillClick()
}
class VisitorView: UIView {

    weak var delegate: VisitorViewDelegate?
    
    func setupVisitorInfo(isHome:Bool, imageName:String, message:String) {
        iconView.hidden = !isHome
        homeIcon.image = UIImage(named: imageName)
        messageLabel.text = message
        if isHome
        {
            startAnimation()
        }
    }
    
    private func startAnimation() {
        let animation = CABasicAnimation(keyPath:"transform.rotation")
        
        animation.toValue = 2 * M_PI
        animation.duration = 20
        animation.repeatCount = MAXFLOAT
        animation.removedOnCompletion = false
        iconView.layer.addAnimation(animation, forKey: nil)

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconView)
        addSubview(homeIcon)
        addSubview(messageLabel)
        addSubview(loginBtn)
        addSubview(registerBtn)
        
        //MARK:-添加约束
        iconView.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self)
        }
        
        homeIcon.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        messageLabel.snp_makeConstraints { (make) in
            make.top.equalTo(iconView.snp_bottom).offset(5)
            make.centerX.equalTo(self)
            make.left.equalTo(50)
            make.right.equalTo(-50)
        }
        
        loginBtn.snp_makeConstraints { (make) in
            make.top.equalTo(messageLabel.snp_bottom).offset(5)
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.right.equalTo(self.snp_centerX).offset(-20)
        }
        
        registerBtn.snp_makeConstraints { (make) in
            make.top.equalTo(loginBtn)
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.left.equalTo(self.snp_centerX).offset(20)

        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var iconView: UIImageView = {
       let iconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return iconView
    }()
    
    //MARK:-懒加载
    private lazy var homeIcon: UIImageView = {
       let homeIcon = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return homeIcon
    }()
    
    private lazy var messageLabel: UILabel = {
       let label = UILabel()
        label.text = "asdadasday6q7wy8u9idasiufbas'jfhpw9fbewopwajfhwbhd;k"
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.Center
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
        delegate?.loginBtnWillClick()
    }
    
    func registerBtnClick()  {
        delegate?.registerBtnWillClick()
    }
    
}
