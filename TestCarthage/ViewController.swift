//
//  ViewController.swift
//  TestCarthage
//
//  Created by ys on 16/8/5.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit
import Social

import ReactiveCocoa
import Result

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textfield.delegate = self
        
//        let menu = MY_Menu.showInpoint(CGPoint(x: 200, y: 400))
//        menu.backgroundColor = UIColor.redColor()
        
        if self .isKindOfClass(UIViewController.self) {
            print("呵呵呵")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        
        let vc: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeSinaWeibo)
        vc.setInitialText("呵呵")
        self.presentViewController(vc, animated: true, completion: nil)
        
        return true
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
    
}

