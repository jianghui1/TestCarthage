//
//  MY_Menu.swift
//  Cover
//
//  Created by Wenhao Jin on 16/8/15.
//  Copyright © 2016年 Wenhao Jin. All rights reserved.
//

import UIKit
protocol MY_MenuDelegate:NSObjectProtocol {
    func back()
    func getRed()
}
class MY_Menu: UIView, UITableViewDelegate, UITableViewDataSource {
    
    // 红包table
    @IBOutlet weak var redWaletTable: UITableView!
    
    // 设置代理
    weak var delegate:MY_MenuDelegate?
    // 加载xib
    class func my_Menu() -> MY_Menu! {
        return NSBundle.mainBundle().loadNibNamed("MY_Menu"
            , owner: nil, options: nil)[0] as! MY_Menu
    }
    
    override func awakeFromNib() {
        redWaletTable.delegate = self
        redWaletTable.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellId")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cellId")
        }
        cell?.textLabel?.text = "呵呵"
        return cell!
    }
    
    // 创建菜单
    class func showInpoint(point:(CGPoint)) -> MY_Menu! {
    // 创建菜单
        let ment    = MY_Menu.my_Menu()
        ment.center = point
        UIApplication.sharedApplication().keyWindow?.addSubview(ment)
        return ment
    }

    // 隐藏菜单
    class func hide() {
        for childer in (UIApplication.sharedApplication().keyWindow?.subviews)!
        {
            if childer.isKindOfClass(self) {
                childer.removeFromSuperview()
            }
        }
    }
    
    @IBAction func getRedWallet(sender: AnyObject) {
        delegate?.getRed()
    }
    @IBAction func back(sender: AnyObject) {
        delegate?.back()
    }
    
    @IBOutlet weak var getRedWallet: UIButton!
    
//    // 隐藏菜单动画
//    class func hideAn(point:CGPoint,completion:()->()) {
//    
//        let completion1 = {
//            ()->() in
//            completion()
//        }
//        for childer in (UIApplication.sharedApplication().keyWindow?.subviews)!
//        {
//            if childer.isKindOfClass(MY_Menu) {
//                setUpHideAnmia(point,)
//                )
//            }
//        }
//    }
//    
//    // 隐藏动画
//    func setUpHideAnmia(point:CGPoint,comption:()->()) {
//        UIView.animateWithDuration(1, animations: {
//            
//            var transform = CGAffineTransformIdentity;
//            
//            transform = CGAffineTransformTranslate(transform, -self.center.x + point.x, -self.center.y + point.y);
//            transform = CGAffineTransformScale(transform, 0.01, 0.01);
//            
//            self.transform = transform;
//
//            }) { (true) in
//                self.removeFromSuperview()
//                
//                if comption {
//                    comption()
//                }
//        }
//    }
}
