//
//  UniButton.swift
//  SmartCounter
//
//  Created by donghoon bae on 2016. 6. 7..
//  Copyright © 2016년 Forethink. All rights reserved.
//

import UIKit

@IBDesignable

// Code for making universal button design

class UniButtonView: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var strokeColor: UIColor = UIColor.redColor()
    @IBInspectable var iconColor: UIColor = UIColor.blueColor()
    @IBInspectable var lineWidth: CGFloat = 3.0

    override func drawRect(rect: CGRect) {
        
        // Drawing base circle
        let basePath = UIBezierPath(ovalInRect: rect)
        basePath.lineWidth = lineWidth
        fillColor.setFill()
        basePath.fill()

        
        if self.tag == 1 {
            // Draw reset
            let arcCenter = CGPoint(x: bounds.width/2, y: bounds.height/2)
            let radius = (bounds.width/2) * 0.4
            //create the path
        
            let circlePath : UIBezierPath = UIBezierPath(arcCenter: arcCenter, radius:
                CGFloat(radius), startAngle: 0, endAngle: 8, clockwise: true)
            
            //set the stroke color
            strokeColor.setStroke()
            
            //draw the stroke
            circlePath.lineWidth = lineWidth
            circlePath.stroke()
            
        } else if self.tag == 2 {
            //Draw minus
            
            let minusWidth: CGFloat = min(bounds.width, bounds.height) * 0.7
            
            //create the path
            let minusPath = UIBezierPath()
            
            //set the path's line width to the height of the stroke
            minusPath.lineWidth = lineWidth
            
            //move the initial point of the path
            //to the start of the horizontal stroke
            minusPath.moveToPoint(CGPoint(
                x:bounds.width/2 - minusWidth/2 + 0.5,
                y:bounds.height/2 + 0.5))
            
            //add a point to the path at the end of the stroke
            minusPath.addLineToPoint(CGPoint(
                x:bounds.width/2 + minusWidth/2 + 0.5,
                y:bounds.height/2 + 0.5))
            
            //set the stroke color
            strokeColor.setStroke()
            minusPath.lineCapStyle = .Round
            //draw the stroke
            minusPath.stroke()
        }
        else if self.tag == 3 {
            //Draw export icon
            //Drawing Arrow stem
            let linePath = UIBezierPath()
            linePath.moveToPoint(CGPoint(x:bounds.width/2, y:bounds.height/2))
            linePath.addLineToPoint(CGPoint(x:bounds.width/2, y:(bounds.height*7)/36))
            //Drawing Arrow head
            linePath.moveToPoint(CGPoint(x:(bounds.width * 5)/12, y:(bounds.height * 11)/36))
            linePath.addLineToPoint(CGPoint(x:bounds.width/2, y:(bounds.height * 5 )/36))
            linePath.addLineToPoint(CGPoint(x:(bounds.width * 7)/12, y:(bounds.height * 11)/36))

            linePath.closePath()
                    //What is miterLinit? tavmjong.free.fr/SVG/MITER_LIMIT/index.html
            linePath.miterLimit = 4;
                    // lineCapStyle can be .Round .Square .Butt
            linePath.lineCapStyle = .Round
            linePath.usesEvenOddFillRule = true
                // fill arrow head
            strokeColor.setFill()
            linePath.fill()
            strokeColor.setStroke()
            linePath.lineWidth = lineWidth
            linePath.stroke()
            
            //Drawing box
            
            let boxPath = UIBezierPath()
            boxPath.moveToPoint(CGPoint(x:(bounds.width*5)/12, y:(bounds.height*5)/12))
            boxPath.addLineToPoint(CGPoint(x:(bounds.width/3), y:(bounds.height*5)/12))
            boxPath.addLineToPoint(CGPoint(x:(bounds.width/3), y:(bounds.height*3)/4))
            boxPath.addLineToPoint(CGPoint(x:(bounds.width*2/3), y:(bounds.height*3)/4))
            boxPath.addLineToPoint(CGPoint(x:(bounds.width*2/3), y:(bounds.height*5)/12))
            boxPath.addLineToPoint(CGPoint(x:(bounds.width*7)/12, y:(bounds.height*5)/12))
            // lineCapStyle can be .Round .Square .Butt
            boxPath.lineCapStyle = .Round
            boxPath.usesEvenOddFillRule = true
            
            strokeColor.setStroke()
            boxPath.lineWidth = lineWidth
            boxPath.stroke()
           

        }
    }
}
