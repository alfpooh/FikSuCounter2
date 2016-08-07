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
    let boilingRecipe: [String] = ["Egg","Potatoes","rusinO"]
    let noodleRecipe: [String] = ["eggnoodleinO","InstantRamen","Somen"]
    let pastaRecipe: [String] = [ "FarFalle13-15","fusili_inO","MacaroniinO","shellinO8-10","Spagehtti"]
    let brineRecipe: [String] = ["cabbageinO"]

    var recipesonCarousel:[String] = [""]
    
    let MenuArray: [String] = ["PASTA","BRINE","ALL","BOILING","NOODLE"]
    let TestArray: [String] = ["1", "2", "3", "4","5"]
    let ReplacingArray: [String]! = nil
    
    func makeallrecipes () -> [String] {
        recipesonCarousel.removeAll()
        recipesonCarousel.appendContentsOf(pastaRecipe)
        recipesonCarousel.appendContentsOf(brineRecipe)
        recipesonCarousel.appendContentsOf(boilingRecipe)
        recipesonCarousel.appendContentsOf(noodleRecipe)
        
        return recipesonCarousel
    }
//    func setnewRecipesonCarousel (setarray: String) {
//        
//        recipesonCarousel.removeAll()
//        
//        switch setarray {
//        case "PASTA":
//            menu.tag = 1
//            recipesonCarousel.appendContentsOf(pastaRecipe)
//        case "BRINE":
//            menu.tag = 2
//            recipesonCarousel.appendContentsOf(brineRecipe)
//        case "BOILING":
//            menu.tag = 3
//            recipesonCarousel.appendContentsOf(boilingRecipe)
//        case "NOODLE":
//            menu.tag = 4
//            recipesonCarousel.appendContentsOf(noodleRecipe)
//        default:
//            menu.tag = 0
//            recipesonCarousel.appendContentsOf(pastaRecipe)
//            recipesonCarousel.appendContentsOf(brineRecipe)
//            recipesonCarousel.appendContentsOf(boilingRecipe)
//            recipesonCarousel.appendContentsOf(noodleRecipe)
//        }
//        isImageAdded = true
//        ClearandAddimages(menu.tag)
//        imageAdding(recipesonCarousel, indextag: menu.tag)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //menu buttons
        
        // set recipe array to all
//        setnewRecipesonCarousel("all")
        
        //creating menu buttons
        menu = ZCarouselTitle(frame: CGRect( x: (self.view.frame.size.width/5),
            y: 100,
            width: (self.view.frame.size.width/5)*3,
            height: 50))
        menu.ZCTitledelegate = self
        menu.addButtons(MenuArray)
        menu.tag = 0
        self.view.addSubview(menu!)
        
        //creating recipes
        ClearandAddimages(menu.tag)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GotoTimer), name: "starttimer", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ChangeMenu), name: "title", object: nil)
    }
    
    func ClearandAddimages(ImageArray: Int) {
        
        if isImageAdded  {
            
            if let viewWithTag = self.view.viewWithTag(ImageArray) {
                viewWithTag.removeFromSuperview()
            }
            
            let imageArray = ReplacingArray
            imageAdding(imageArray,indextag: ImageArray)
        }
            // case of false, initialiation
        else {
            let imageArray: [String] = makeallrecipes()
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
        images.addImages(toaddarray)
        images.tag = indextag
        self.view.addSubview(images)
    }
    
    func imageReplacing (toaddarray: AnyObject) {
        for v in self.view.subviews{
            v.removeFromSuperview()
        }
        
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
        
        print("Showing Title index \(index)")

        currentIndex = index
        
//        switch  currentIndex {
//        case 1 :
//            setnewRecipesonCarousel("PASTA")
//        case 2 :
//            setnewRecipesonCarousel("BRINE")
//        case 3 :
//            setnewRecipesonCarousel("ALL")
//        case 4 :
//            setnewRecipesonCarousel("BOILING")
//        case 5 :
//            setnewRecipesonCarousel("NOODLE")
//        default: break
//        
//        }
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

