//
//  TabLens.swift
//  SmartCounter
//
//  Created by donghoon bae on 2016. 6. 7..
//  Copyright © 2016년 Forethink. All rights reserved.
//

import UIKit

@IBDesignable

// Code for making universal Lense design

class UniLensView: UIButton {
    
    @IBInspectable var lensfillColor: UIColor = UIColor.greenColor()
    @IBInspectable var lensstrokeColor: UIColor = UIColor.redColor()
    @IBInspectable var lensLinewidth: CGFloat = 2
    
    override func drawRect(rect: CGRect) {
        
        // Drawing base circle
        let lensPath = UIBezierPath(ovalInRect: rect)
        lensfillColor.setFill()
        lensPath.fill()
        
        // Draw Stroke
        let arcCenter = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius = (bounds.width/2) - (lensLinewidth/2)
        //create the path
        
        let circlePath : UIBezierPath = UIBezierPath(arcCenter: arcCenter, radius:
            CGFloat(radius), startAngle: 0, endAngle: 8, clockwise: true)
        
        //set the stroke color
        lensstrokeColor.setStroke()
        circlePath.lineWidth = lensLinewidth
        //draw the stroke
        circlePath.stroke()

        
    }
    
    
    
}
