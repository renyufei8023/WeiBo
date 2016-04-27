//
//  TitleBtn.swift
//  weibo
//
//  Created by 任玉飞 on 16/4/26.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

import UIKit

class TitleBtn: UIButton {

    override init(frame:CGRect) {
        super.init(frame: frame)
        setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        setImage(UIImage(named: "navigationbar_arrow_down"), forState: UIControlState.Normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), forState: UIControlState.Selected)
        self.sizeToFit()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.x = 0
        imageView?.x = (titleLabel?.width)!
    }
    
}
