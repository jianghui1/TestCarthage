//
//  NextViewController.swift
//  TestCarthage
//
//  Created by ys on 16/8/19.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var dataArray: Array = {
        return [1, 2, 2, 3, 5, 6]
    }()
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let element = dataArray[indexPath.row]
        if element % 2 == 0{
            let cell = tableView.dequeueReusableCellWithIdentifier("firstCell") as! FirstCell
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("secondCell") as! SecondCell
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if dataArray[indexPath.row] % 2 == 0 {
            return 100
        }
        return 120
    }
    

}
