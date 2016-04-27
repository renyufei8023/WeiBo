//
//  QRCodeViewController.swift
//  weibo
//
//  Created by 任玉飞 on 16/4/27.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController {

    @IBOutlet weak var scanImageView: UIImageView!
    @IBOutlet weak var scanLineCons: NSLayoutConstraint!
    @IBOutlet weak var containerHeihhtCons: NSLayoutConstraint!
    @IBOutlet weak var tabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbar.selectedItem = tabbar.items![0]
        self.scanLineCons.constant = -self.containerHeihhtCons.constant
        self.scanImageView.layoutIfNeeded()
        
        UIView.animateWithDuration(2.0, animations: {
            self.scanLineCons.constant = self.containerHeihhtCons.constant
            UIView.setAnimationRepeatCount(MAXFLOAT)
            self.scanImageView.layoutIfNeeded()
            }, completion: nil)
        // Do any additional setup after loading the view.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
