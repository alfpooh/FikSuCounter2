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
    var boilingRecipe: [String] = [""]
    var noodleRecipe: [String] = [""]
    var pastaRecipe: [String] = [""]
    var roastRecipe: [String] = [""]
    var MenuArray: [String] = [""]
    let TestArray: [String] = ["1", "2", "3", "4","5"]
    let recipeGroup: [String] = ["boilingRecipe","noodleRecipe","pastaRecipe","roastRecipe"]
    let ReplacingArray: [String]! =  nil
    var allrecipe: [String] = [""]
    var totalrecipenumber: Int = 15
    
    func loadArraysJson () {
        //json
        if let path = NSBundle.mainBundle().pathForResource("FiksuTimerRecipes", ofType: "json") {
            do {
                let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let jsonObj = JSON(data: data)
                if jsonObj != JSON.null {
                    
                    //print("jsonData:\(jsonObj)")
                    // playing with json
                    //print("test: \(jsonObj["cooktype"])")
                    
                    //Cooktype from Jason!
                    MenuArray.removeAll()
                    let count = jsonObj["cooktype"].count - 1
                    for i in 0...count {
                        MenuArray.append(jsonObj["cooktype"][i].string!)
                    }
                    
                    //Taking all recipes from Jason!
                    
                    if let number: Int = jsonObj["Recipes"].count {
                        print("Total recipes number are \(number)")
                        totalrecipenumber = number
                        allrecipe.removeAll()
                        for i in 0...(number - 1) {
                            
                            //print("\(jsonObj["Recipes"][i]["title"])")
                            allrecipe.append(jsonObj["Recipes"][i]["title"].stringValue)
                        }
                        
                        
                    } else {
                        //Print the error
                        print("errr")
                    }
                    
                    //Taking each recipes from Jason!
                    pastaRecipe.removeAll()
                    for j in 0...(totalrecipenumber - 1){
                        if jsonObj["Recipes"][j]["cooktype"] == "Pasta" {
                            pastaRecipe.append(jsonObj["Recipes"][j]["title"].stringValue)
                        }
                    }//Taking each recipes from Jason!
                    
                    //Taking each recipes from Jason!
                    boilingRecipe.removeAll()
                    for j in 0...(totalrecipenumber - 1){
                        if jsonObj["Recipes"][j]["cooktype"] == "Boiling" {
                            print ("\(jsonObj["Recipes"][j]["title"].stringValue)")
                            boilingRecipe.append(jsonObj["Recipes"][j]["title"].stringValue)
                            print("\(boilingRecipe)")
                        }
                    }//Taking each recipes from Jason!
                    
                    //Taking each recipes from Jason!
                    roastRecipe.removeAll()
                    for j in 0...(totalrecipenumber - 1){
                        if jsonObj["Recipes"][j]["cooktype"] == "Roast" {
                            roastRecipe.append(jsonObj["Recipes"][j]["title"].stringValue)
                        }
                    }//Taking each recipes from Jason!
                    
                    //Taking each recipes from Jason!
                    noodleRecipe.removeAll()
                    for j in 0...(totalrecipenumber - 1){
                        if jsonObj["Recipes"][j]["cooktype"] == "Noodle" {
                            noodleRecipe.append(jsonObj["Recipes"][j]["title"].stringValue)
                        }
                    }//Taking each recipes from Jason!
                    
                    
                    
                }
                else {
                    print("could not get json from file, make sure that file contains valid json.")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if allrecipe.count == 1 {loadArraysJson ()}
        
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
        
        if currentIndex == nil {currentIndex = 8}
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

