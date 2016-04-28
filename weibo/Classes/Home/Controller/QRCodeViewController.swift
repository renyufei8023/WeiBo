//
//  QRCodeViewController.swift
//  weibo
//
//  Created by 任玉飞 on 16/4/27.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: UIViewController,UITabBarDelegate {

    @IBOutlet weak var scanImageView: UIImageView!
    @IBOutlet weak var scanLineCons: NSLayoutConstraint!
    @IBOutlet weak var containerHeihhtCons: NSLayoutConstraint!
    @IBOutlet weak var tabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbar.selectedItem = tabbar.items![0]
        
        tabbar.delegate = self
        statrtAnimation()
        
        startScan()
    }
    
    //扫描动画
    private func statrtAnimation() {
        self.scanLineCons.constant = -self.containerHeihhtCons.constant
        self.scanImageView.layoutIfNeeded()
        
        UIView.animateWithDuration(2.0, animations: {
            self.scanLineCons.constant = self.containerHeihhtCons.constant
            UIView.setAnimationRepeatCount(MAXFLOAT)
            self.scanImageView.layoutIfNeeded()
            }, completion: nil)
    }
    
    private func startScan() {
        // 1.判断是否能够将输入添加到会话中
        if !session.canAddInput(avcapInput) {
            return
        }
        
        // 2.判断是否能够将输出添加到会话中
        if !session.canAddOutput(output) {
            return
        }
        // 3.将输入和输出都添加到会话中
        session.addInput(avcapInput)
        print(output.availableMetadataObjectTypes)
        session.addOutput(output)
        print(output.availableMetadataObjectTypes)
        
        // 4.设置输出能够解析的数据类型
        // 注意: 设置能够解析的数据类型, 一定要在输出对象添加到会员之后设置, 否则会报错
        output.metadataObjectTypes = output.availableMetadataObjectTypes
        
        // 5.设置输出对象的代理, 只要解析成功就会通知代理
        output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        
        // 添加预览图层
        view.layer.insertSublayer(previewLayer, atIndex: 0)
        
        // 添加绘制图层到预览层上面
        previewLayer.addSublayer(drawlayer)
        
        // 6.开始扫描
        session.startRunning()
        
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        if item.tag == 1 {
            self.containerHeihhtCons.constant = 300
        }else{
            self.containerHeihhtCons.constant = 150
        }
        
        self.scanImageView.layer.removeAllAnimations()
        
        statrtAnimation()
    }
    
    //会话
    private lazy var session: AVCaptureSession = AVCaptureSession ()
    
    //拿到输入设备,可能是空的所以是可选类型
    private lazy var avcapInput: AVCaptureDeviceInput? = {
        // 获取摄像头
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        do{
            // 创建输入对象
            let input = try AVCaptureDeviceInput(device: device)
            return input
        }catch{
            print(error)
            return nil
        }
        
    }()
    
    //拿到输出对象
    private lazy var output: AVCaptureMetadataOutput = AVCaptureMetadataOutput()
    
    //创建预览图层
    private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let layer = AVCaptureVideoPreviewLayer(session: self.session)
        layer.frame = UIScreen.mainScreen().bounds
        return layer
    }()
    
    private lazy var drawlayer: CALayer = {
        let layer = CALayer()
        layer.frame = UIScreen.mainScreen().bounds
        return layer
    }()
    
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func myCardBtnClick(sender: AnyObject) {
        navigationController?.pushViewController(QRCodeCardViewController(), animated: true)
    }

}

extension QRCodeViewController: AVCaptureMetadataOutputObjectsDelegate
{
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!)
    {
        //0.清空图层
        clearConers()
        print(metadataObjects.last?.stringValue)
        
        //1.获取扫描到二维码的位置
        for object in metadataObjects {
            //1.1判断当前获取到的数据，是否是机器可以识别的类型
            if object is AVMetadataMachineReadableCodeObject {
                //1.2将坐标转换界面可是别的坐标
                let codeobject = previewLayer.transformedMetadataObjectForMetadataObject(object as! AVMetadataObject) as! AVMetadataMachineReadableCodeObject
                
                drawCorners(codeobject)
            }
        }
    }
    
    private func drawCorners(codeobject: AVMetadataMachineReadableCodeObject) {
        if codeobject.corners.isEmpty {
            return
        }
        
        //1.创建一个图层
        let layer = CAShapeLayer()
        layer.lineWidth = 2
        layer.strokeColor = UIColor.greenColor().CGColor
        layer.fillColor = UIColor.clearColor().CGColor
        
        //2.创建一个路径
        let path = UIBezierPath()
        var point = CGPointZero
        var index = 0
        //2.1移动第一个点
        CGPointMakeWithDictionaryRepresentation((codeobject.corners[index++] as! CFDictionaryRef), &point)
        path.moveToPoint(point)
        
        //2.2移动到其他的点
        while index < codeobject.corners.count {
            CGPointMakeWithDictionaryRepresentation((codeobject.corners[index++] as! CFDictionaryRef), &point)
            path.addLineToPoint(point)
        }
        
        //2.3关闭路径
        path.closePath()
        
        //2.4绘制路径
        layer.path = path.CGPath
        
        //3.将绘制好的图层添加到drawLayer上
        drawlayer.addSublayer(layer)
        
    }
    
    private func clearConers() {
        
        // 1.判断drawLayer上是否有其它图层
        if drawlayer.sublayers == nil || drawlayer.sublayers?.count == 0 {
            return
        }
        
        //2.移除所有子图层
        for subLayer in drawlayer.sublayers! {
            subLayer.removeFromSuperlayer()
        }
    }
}
