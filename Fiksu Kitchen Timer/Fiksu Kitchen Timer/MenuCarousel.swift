//
//  ViewController.swift
//  Fiksu Kitchen Timer
//
//  Created by donghoon bae on 2016. 7. 1..
//  Copyright © 2016년 Forethink. All rights reserved.
//

import UIKit
import AVFoundation

@IBDesignable


class MenuViewController: UIViewController, ZCarouselDelegate, ZCarouselTitleDelegate {
    
   // var menu: ZCarousel!
    var images: ZCarousel!
    var menu: ZCarouselTitle!
    var currentIndex: Int!
    var currentMenu: Int!
    var isImageAdded = false

    //Recipes
    let Boiling: [String] = ["InstantRamen", "Fusilli", "Potatoes", "Spagehtti","Somen","Egg"]
    let MenuArray: [String] = ["Boiling", "Roasting", "Steaming", "Resting","Oven","Slow","Coffee","Tea"]
    let TestArray: [String] = ["1", "2", "3", "4","5"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //menu buttons
        
        menu = ZCarouselTitle(frame: CGRect( x: (self.view.frame.size.width/5),
            y: 100,
            width: (self.view.frame.size.width/5)*3,
            height: 50))
        menu.ZCTitledelegate = self
        menu.addButtons(MenuArray)
        self.view.addSubview(menu!)
        currentMenu = 0
        ClearandAddimages(currentMenu)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GotoTimer), name: "starttimer", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ChangeMenu), name: "title", object: nil)
    }
    
    func ClearandAddimages(ImageArray: Int) {
        
        if isImageAdded  {
            
            if let viewWithTag = self.view.viewWithTag(1) {
                viewWithTag.removeFromSuperview()
            }
            
            let imageArray = TestArray
            imageAdding(imageArray)
        }
        else {
            let imageArray = Boiling
            imageAdding(imageArray)
            isImageAdded = true
        }
    }
    
    func imageAdding (toaddarray: AnyObject) {
        images = ZCarousel(frame: CGRect( x: self.view.frame.size.width/5-10,
            y: 200,
            width: ((self.view.frame.size.width/5)*3),
            height: (self.view.frame.size.width/5)*3))
        images.ZCdelegate = self
        images.addImages(toaddarray as! [String])
        images.tag = 1
        self.view.addSubview(images)
    }
    
    func GotoTimer(sender: AnyObject) {

                if currentIndex == nil {currentIndex = 0}
                let str = "\(currentIndex)"
                performSegueWithIdentifier("GoTimer", sender: str)

    }
    
    func ChangeMenu (sender: AnyObject) {
        ClearandAddimages(1)
        print("Testing change added images")
    
    }
    
    func ZCarouselShowingIndex(scrollview: ZCarousel, index: Int) {
        //if scrollview == menu {
        //    print("Showing Button at index \(index)")
        //}
        //else if scrollview == images {
            print("Showing Image at index \(index)")
        currentIndex = index
       // }
    }
    func ZCarouselTitleShowingIndex(scrollview: ZCarouselTitle, index: Int) {
        //if scrollview == menu {
        //    print("Showing Button at index \(index)")
        //}
        //else if scrollview == images {
        print("Showing Title index \(index)")
        currentIndex = index
        // }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //This is where you do work right before the view loads
        //keep in mind - the next View controller has already been initialized
        if segue.identifier == "GoTimer" {
            if let ViewController = segue.destinationViewController as? ViewController {
                
                if let theString = sender as? String {
                    ViewController.transferText = String(theString)
                }
            }
        }
        
    }
 
}

