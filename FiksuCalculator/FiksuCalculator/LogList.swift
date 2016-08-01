//
//  LogList.swift
//  Fiksu Calc
//
//  Created by donghoon bae on 2016. 7. 31..
//  Copyright © 2016년 Forethink. All rights reserved.
//
// thanks to https://github.com/SwiftyJSON/SwiftyJSON#requirements


import Foundation
import SwiftyJSON

let baseurl = "http://www.forethink.nu/alfpooh/Fiksu/recipe.json"

class Loglist: UIViewController{
    
    func getJson () {
    
        let url = NSURL (string: baseurl )
        let request = NSURLRequest (URL: url!)
        let session = NSURLSession (configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            if error == nil {
      
                let SwiftyJSON = JSON(data: data)
                let theTitle = SwiftyJSON["results"][0][""].stringValue
                print (theTitle)
                
            } else {
            print ("There was an error.")
            }
            
            
    }
}