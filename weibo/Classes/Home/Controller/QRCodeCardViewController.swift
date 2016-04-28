


//
//  QRCodeCardViewController.swift
//  weibo
//
//  Created by 任玉飞 on 16/4/28.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

import UIKit

class QRCodeCardViewController: UIViewController {

    let iconView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(iconView)
        iconView.snp_makeConstraints { (make) in
            make.center.equalTo(view)
            make.size.equalTo(200)
        }
        iconView.image = creatQRCode()
        
    }

    func creatQRCode() -> UIImage {
        //1.创建滤镜
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        //2.还原滤镜默认属性
        filter?.setDefaults()
        
        //3.设置需要生成二维码的数据
        filter?.setValue("任玉飞".dataUsingEncoding(NSUTF8StringEncoding), forKeyPath: "inputMessage")
        
        //4.从滤镜中取出生成好的图片
        let ciImage = filter?.outputImage
        
        return UIImage(CIImage: ciImage!)

        
    }

}
