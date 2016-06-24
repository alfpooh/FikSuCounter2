//
//  BackgroundPattern.swift
//  SmartCounter
//
//  Created by donghoon bae on 2016. 6. 7..
//  Copyright © 2016년 Forethink. All rights reserved.
//

import UIKit

@IBDesignable
    
class BackgroundPattern: UIView {
        
        //1
        @IBInspectable var lightColor: UIColor = UIColor.orangeColor()
        @IBInspectable var medColor: UIColor = UIColor.blueColor()
        @IBInspectable var darkColor: UIColor = UIColor.whiteColor()
        @IBInspectable var backColor: UIColor = UIColor.yellowColor()
        @IBInspectable var patternSize:CGFloat = 8
        @IBInspectable var drawScale:CGFloat = 1
    
        override func drawRect(rect: CGRect) {
            //2
            let context = UIGraphicsGetCurrentContext()
            
            //3
            CGContextSetFillColorWithColor(context, darkColor.CGColor)
            
            //4
            
            let drawSize = CGSize(width: patternSize, height: patternSize)
            let drawScaleW = drawSize.width * drawScale
            let drawScaleH = drawSize.height * drawScale

            UIGraphicsBeginImageContextWithOptions(drawSize, true, 0.0)
            let drawingContext = UIGraphicsGetCurrentContext()
            
            //set the fill color for the new context
            backColor.setFill()
            CGContextFillRect(drawingContext,
                              CGRectMake(0, 0, drawScaleW, drawScaleH ))
            
            
            //// Oval Drawing
            let ovalPath = UIBezierPath(ovalInRect: CGRect(x:0, y:0, width: (drawScaleW*3)/4, height: (drawScaleH*3)/4))
            lightColor.setFill()
            ovalPath.fill()
            
            
            //// Oval 2 Drawing
            let oval2Path = UIBezierPath(ovalInRect: CGRect(x:(drawScaleW*2)/7, y: drawScaleH/2, width: drawScaleW/2, height: drawScaleH/2))
            darkColor.setFill()
            lightColor.setStroke()
            oval2Path.fill()
            oval2Path.stroke()
            
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            UIColor(patternImage: image).setFill()
            CGContextFillRect(context, rect)

}
}
