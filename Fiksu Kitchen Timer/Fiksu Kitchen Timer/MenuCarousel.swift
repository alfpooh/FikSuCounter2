//
//  MenuCarousel.swift
//  Fiksu Kitchen Timer
//
//  Created by donghoon bae on 2016. 7. 1..
//  Copyright © 2016년 Forethink. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftyJSON

@IBDesignable


class MenuViewController: UIViewController, ZCarouselDelegate, ZCarouselTitleDelegate {
    
    // var menu: ZCarousel!
    var images: ZCarousel!
    var menu: ZCarouselTitle!
    var currentIndex: Int!
    var currentMenuIndex: Int!
    var isImageAdded = false
    var lasttag = 2
    
    //Recipes
    let boilingRecipe: [String] = ["Egg","Potatoes","Buckwheat"]
    let noodleRecipe: [String] = ["Egg noodle","Instant ramen","Somen"]
    let pastaRecipe: [String] = [ "Farfalle","Fusili","Macaroni","Conchiglie","Spagehtti","Tagliatelle"]
    let roastRecipe: [String] = ["Beef","Chicken","Salmon"]
    let MenuArray: [String] = ["PASTA","ROAST","ALL","BOILING","NOODLE"]
    let TestArray: [String] = ["1", "2", "3", "4","5"]
    let recipeGroup: [String] = ["boilingRecipe","noodleRecipe","pastaRecipe","roastRecipe"]
    let ReplacingArray: [String]! =  nil
    var allrecipe: [String] = ["Egg","Potatoes","Buckwheat","Egg noodle","Instant ramen","Somen","Farfalle","Fusili","Macaroni","Conchiglie","Spagehtti","Tagliatelle","Beef","Chicken","Salmon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //creating menu buttons
        menu = ZCarouselTitle(frame: CGRect( x: (self.view.frame.size.width/5),
            y: 100,
            width: (self.view.frame.size.width/5)*3,
            height: 50))
        menu.ZCTitledelegate = self
        menu.addButtons(MenuArray)
        menu.tag = 0
        self.view.addSubview(menu!)
        
        //creating recipes all
        ClearandAddimages(2) // 2 is All as default
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GotoTimer), name: "starttimer", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ChangeMenu), name: "title", object: nil)
    }
    

    
    func ClearandAddimages(ImageArray: Int) {
        
        if isImageAdded  {
            
            if let viewWithTag = self.view.viewWithTag(ImageArray) {
                viewWithTag.removeFromSuperview()
            }
            
            if let imageArray = ReplacingArray {
                imageAdding(imageArray,indextag: ImageArray)}
        }
            // case of false, initialiation
        else {
            let imageArray: [String] = allrecipe
            imageAdding(imageArray,indextag: ImageArray)
            isImageAdded = true
        }
    }
    
    func imageAdding (toaddarray: [String], indextag: Int) {
        images = ZCarousel(frame: CGRect( x: self.view.frame.size.width/5-10,
            y: 200,
            width: ((self.view.frame.size.width/5)*3),
            height: (self.view.frame.size.width/5)*3))
        images.ZCdelegate = self
        images.tag = indextag
        images.addImages(toaddarray)
        
        self.view.addSubview(images)
    }
    
    func imageReplacing (toaddarray: [String], indextag: Int) {
        images.viewWithTag(lasttag)!.removeFromSuperview()
        lasttag = indextag
        images = ZCarousel(frame: CGRect( x: self.view.frame.size.width/5-10,
            y: 200,
            width: ((self.view.frame.size.width/5)*3),
            height: (self.view.frame.size.width/5)*3))
        images.ZCdelegate = self
        images.tag = indextag
        images.addImages(toaddarray)
        self.view.addSubview(images)
    }
    
    
    func GotoTimer(sender: AnyObject) {
        
        if currentIndex == nil {currentIndex = 0}
        if currentMenuIndex == nil { currentMenuIndex = 2}
        let str = "\(currentMenuIndex):\(currentIndex)"
        performSegueWithIdentifier("GoTimer", sender: str)
    }
    
    
    func ChangeMenu (sender: AnyObject) {
        ClearandAddimages(2)
        print("Testing change added images")
        
    }
    
    func ZCarouselShowingIndex(scrollview: ZCarousel, index: Int) {
        
        print("Showing Image at index \(index)")
        currentIndex = index
        
    }
    
    
    
    func ZCarouselTitleShowingIndex(scrollview: ZCarouselTitle, index: Int) {
        
        
        print("Showing Title index \(index)")
        currentMenuIndex = index
        
        switch currentMenuIndex {
            
        case 0:
            imageReplacing(pastaRecipe, indextag: 0)
        case 1:
            imageReplacing(roastRecipe, indextag: 1)
        case 3:
            imageReplacing(boilingRecipe, indextag: 3)
        case 4:
            imageReplacing(noodleRecipe, indextag: 4)
        default:
            imageReplacing(allrecipe, indextag: 2)
        }
        
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
    
    @IBAction func showPopUp(sender: AnyObject) {
        let popupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("popuprecipe") as! popUpViewC
        self.addChildViewController(popupVC)
        popupVC.view.frame = self.view.frame
        self.view.addSubview(popupVC.view)
        popupVC.didMoveToParentViewController(self)
        
    }
}

