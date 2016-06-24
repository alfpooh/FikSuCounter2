    //
//  GraphView.swift
//  Smart Count
//
//  Created by donghoon bae on 2016. 6. 8..
//  Copyright © 2016년 Forethink. All rights reserved.
//

    import UIKit
    
    class GraphView: UIView {
        @IBInspectable var graphColor: UIColor = UIColor.blueColor()
        @IBInspectable var graphstrokeColor: UIColor = UIColor.blueColor()
        @IBInspectable var fillColor: UIColor = UIColor.whiteColor()
        @IBInspectable var lineWidth: CGFloat = 2.0
        
        override func drawRect(rect: CGRect) {
            // Draw base circle
            let basePath = UIBezierPath(ovalInRect: rect)
            basePath.lineWidth = lineWidth
            fillColor.setFill()
            basePath.fill()
            
            //Draw base axis
            
            let boxWidth: CGFloat = (min(bounds.width, bounds.height)) * 0.75
            
            //create the path
            let boxPath = UIBezierPath()
            
            //set the path's line width to the height of the stroke
            boxPath.lineWidth = lineWidth
            
            //move the initial point of the path
            //to the start of the horizontal stroke
            boxPath.moveToPoint(CGPoint(
                x:bounds.width/2 - boxWidth/2 + 0.5,
                y:(bounds.height*0.72) ))
            
            //add a point to the path at the end of the stroke
            boxPath.addLineToPoint(CGPoint(
                x:bounds.width/2 + boxWidth/2 + 0.5,
                y:(bounds.height*0.72)))
            
            //set the stroke color
            boxPath.lineCapStyle = .Round
            //draw the stroke
            graphstrokeColor.setStroke()
            boxPath.lineWidth = 1
            boxPath.stroke()
            }

}
