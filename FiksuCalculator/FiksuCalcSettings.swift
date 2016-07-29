//
//  FiksuCalcSettings.swift
//  Fiksu Calc
//
//  Created by donghoon bae on 2016. 7. 29..
//  Copyright © 2016년 Forethink. All rights reserved.
//

import UIKit

class FiksuCalcSettings: UITableViewController {
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 3
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! FiksuCalcTableViewCell
        
        // Configure the cell...
        if indexPath.row == 0 {
            cell.settingicon.image = UIImage(named: "setting.png")
            cell.settinglabel.text = "Toggle sound effect"
            
            //        } else if indexPath.row == 1 {
            //            cell.postImageView.image = UIImage(named: "custom-segue-featured-1024")
            //            cell.postTitleLabel.text = "Building a Chat App in Swift Using Multipeer Connectivity Framework"
            //            cell.authorLabel.text = "Gabriel Theodoropoulos"
            //            cell.authorImageView.image = UIImage(named: "appcoda-300")
            //
            //        } else {
            //            cell.postImageView.image = UIImage(named: "webkit-featured")
            //            cell.postTitleLabel.text = "A Beginner’s Guide to Animated Custom Segues in iOS 8"
            //            cell.authorLabel.text = "Gabriel Theodoropoulos"
            //            cell.authorImageView.image = UIImage(named: "appcoda-300")
            //
            //        }
            
            
        }
        
        return cell
    }
}