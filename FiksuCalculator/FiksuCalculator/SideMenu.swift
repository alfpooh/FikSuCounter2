//
//  SideMenu.swift
//  Fiksu Calc
//
//  Created by donghoon bae on 2016. 8. 3..
//  Copyright © 2016년 Forethink. All rights reserved.
//

import UIKit

class SideMenu: UIViewController {

    private let supportURL = "https://www.facebook.com/groups/1773702546174743/"
    @IBAction func supportGroup(sender: AnyObject) {
        if let url = NSURL(string: supportURL){
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBOutlet weak var logTextBox: UILabel!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}
