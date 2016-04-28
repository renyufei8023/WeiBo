//
//  UIImage+Extension.swift
//  weibo
//
//  Created by 任玉飞 on 16/4/28.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

import Foundation

extension UIImage
{
    /**
     两张图片合成一张新图片
     
     - parameter bgImage:   <#bgImage description#>
     - parameter iconImage: <#iconImage description#>
     
     - returns: <#return value description#>
     */
    func createImage(bgImage:UIImage, iconImage:UIImage, iconSize:CGSize) -> UIImage {
        //1.开启图片上下文
        UIGraphicsBeginImageContext(bgImage.size)
        //2.绘制北京图片
        bgImage.drawInRect(CGRect(origin: CGPointZero, size: bgImage.size))
        //3.绘制头像
        let x = (bgImage.size.width - (iconSize.width)) * 0.5
        let y = (bgImage.size.height - iconSize.height) * 0.5
        iconImage.drawInRect(CGRect(x: x, y: y, width: iconSize.width, height: iconSize.height))
        //4.取出图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        //5.关闭上下文
        UIGraphicsEndImageContext()
        //6.返回图片
        return newImage
    }
}
