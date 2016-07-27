//
//  UniButton.swift
//  based on ForethinkToolBox, created by Dr. Alf
//  Fiksu Kitchen Timer
//
//  Created by donghoon bae on 2016. 7. 1..
//  Copyright © 2016년 Forethink. All rights reserved.
//

import UIKit

@IBDesignable

// Code for making universal button design

class FtkToolBtn: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()  { didSet {setNeedsDisplay()} }
    @IBInspectable var strokeColor: UIColor = UIColor.whiteColor()  { didSet {setNeedsDisplay()} }
    @IBInspectable var iconScale: CGFloat = 1.0  { didSet {setNeedsDisplay()} }
    @IBInspectable var strokelineWidth: CGFloat = 1.0  { didSet {setNeedsDisplay()} }
    @IBInspectable var miterlimit: CGFloat = 4  { didSet {setNeedsDisplay()} }
    @IBInspectable var offsetX: CGFloat = 0  { didSet {setNeedsDisplay()} }
    @IBInspectable var offsetY: CGFloat = 0  { didSet {setNeedsDisplay()} }
    @IBInspectable var specialF: CGFloat = 1  { didSet {setNeedsDisplay()} }
    @IBInspectable var LineCapStyle: CGLineCap?  { didSet {setNeedsDisplay()} }
    @IBInspectable var AnimationSW: Bool = false  { didSet {setNeedsDisplay()} }
    @IBInspectable var tagnumber: Int = 0 { didSet {setNeedsDisplay()} }
    
    
    
    
    override func drawRect(rect: CGRect) {
        //avoid 0 and minus for iconScale
        if iconScale <= 0 {
            iconScale = 0.01
        }
        
        let cordiW = bounds.width
        let cordiH = bounds.height
        
        // Drawing base circle(Gong!)
        let gongPath = UIBezierPath(ovalInRect: rect)
        gongPath.lineWidth = strokelineWidth
        fillColor.setFill()
        gongPath.fill()
        
        //tagnumber = self.tag
        
        if tagnumber == 1 {
            // RESET or O button
            
            let arcCenter = CGPoint(x: cordiW/2, y: cordiH/2)
            let radius = ((bounds.width/2) * 0.4) * iconScale
            //create the path
            
            let circlePath : UIBezierPath = UIBezierPath(arcCenter: arcCenter, radius:
                CGFloat(radius), startAngle: 0, endAngle: 8, clockwise: true)
            
            //set the stroke color
            strokeColor.setStroke()
            //set offset
            circlePath.applyTransform(CGAffineTransformMakeTranslation(offsetX, offsetY))
            
            if specialF > 0 {
                strokeColor.setFill()
                circlePath.fill()
            }
            
            //draw the stroke
            circlePath.lineWidth = strokelineWidth
            circlePath.stroke()
            
            //animation
            if AnimationSW == true {
                UIView.animateWithDuration(3, animations: {
                    circlePath.applyTransform(CGAffineTransformMakeTranslation(55, 55))
                })
            }
            
            
        } else if tagnumber == 2 {
            //MINUS button
            
            let minusWidth: CGFloat = min(cordiW, cordiH) * 0.7
            
            //create the path
            let minusPath = UIBezierPath()
            
            //set the path's line width to the height of the stroke
            minusPath.lineWidth = strokelineWidth
            
            //move the initial point of the path
            //to the start of the horizontal stroke
            minusPath.moveToPoint(CGPoint(
                x:(cordiW/2 - (minusWidth/2 * iconScale) + 0.5),
                y:cordiH/2 + 0.5))
            
            //add a point to the path at the end of the stroke
            minusPath.addLineToPoint(CGPoint(
                x:(cordiW/2 + (minusWidth/2 * iconScale) + 0.5),
                y:cordiH/2 + 0.5))
            //set o center
            minusPath.applyTransform(CGAffineTransformMakeTranslation(-cordiW/2,-cordiH/2))
            
            // use special for rotating
            minusPath.applyTransform(CGAffineTransformMakeRotation(specialF))
            
            //set back
            minusPath.applyTransform(CGAffineTransformMakeTranslation((cordiW/2)+offsetX,(cordiH/2)+offsetY))
            
            //set the stroke color
            strokeColor.setStroke()
            //.lineCapStyle .Butt .Round .Square
            minusPath.lineCapStyle = .Round
            //draw the stroke
            minusPath.stroke()
        }
        else if tagnumber == 3 {
            //PLUS Button
            let mfactor: CGFloat = (min(cordiW, cordiH))
            //create the path
            let plusPath = UIBezierPath()
            //set the path's line width to the height of the stroke
            plusPath.lineWidth = strokelineWidth
            
            let strokePoneX: CGFloat = (cordiW/2)-mfactor
            let strokePtwoX: CGFloat = (cordiW/2)+mfactor
            let strokePoneY: CGFloat = (cordiH/2)+0.5
            //move the initial point of the path
            //to the start of the horizontal stroke
            plusPath.moveToPoint(CGPoint(
                x:strokePoneX,
                y:strokePoneY))
            
            //add a point to the path at the end of the stroke
            plusPath.addLineToPoint(CGPoint(
                x:strokePtwoX,
                y:strokePoneY))
            
            //move the initial point of the path
            //to the start of the vertical stroke
            plusPath.moveToPoint(CGPoint(x:strokePoneY,y:(strokePoneX-specialF)))
            
            //add a point to the path at the end of the stroke
            plusPath.addLineToPoint(CGPoint(x:strokePoneY,y:(strokePtwoX+specialF)))
            
            // scale
            plusPath.applyTransform(CGAffineTransformMakeTranslation(-cordiW/2,-cordiH/2))
            plusPath.applyTransform(CGAffineTransformMakeScale(iconScale,iconScale))
            
            //set back and offset
            plusPath.applyTransform(CGAffineTransformMakeTranslation((cordiW/2)+offsetX,(cordiH/2)+offsetY))
            
            //set the stroke color
            strokeColor.setStroke()
            plusPath.lineCapStyle = .Round
            plusPath.lineWidth = strokelineWidth
            
            //draw the stroke
            plusPath.stroke()
            
        } else if tagnumber == 4 {
            // \\\ 2 lines Pause
            if specialF == 0 {specialF = 10} //default
            //Drawing Arrow stem
            
            let minusWidth: CGFloat = min(cordiW, cordiH) * 0.7
            
            //create the path
            let minusPath = UIBezierPath()
            
            //set the path's line width to the height of the stroke
            minusPath.lineWidth = strokelineWidth
            
            //move the initial point of the path
            //Centr line: to the start of the horizontal stroke
            minusPath.moveToPoint(CGPoint(
                x:(cordiW/2 - (minusWidth/2)),
                y:cordiH/2 + specialF))
            
            //Centr line:  add a point to the path at the end of the stroke
            minusPath.addLineToPoint(CGPoint(
                x:(cordiW/2 + (minusWidth/2)),
                y:cordiH/2 + specialF))
            
            
            //Centr line: to the start of the horizontal stroke
            minusPath.moveToPoint(CGPoint(
                x:(cordiW/2 - (minusWidth/2)),
                y:cordiH/2))
            
            //Centr line:  add a point to the path at the end of the stroke
            minusPath.addLineToPoint(CGPoint(
                x:(cordiW/2 + (minusWidth/2)),
                y:cordiH/2 ))
            //scale
            minusPath.applyTransform(CGAffineTransformMakeTranslation(-cordiW/2,-cordiH/2))
            minusPath.applyTransform(CGAffineTransformMakeScale(iconScale,iconScale))
            
            // use special for rotating
            minusPath.applyTransform(CGAffineTransformMakeRotation(CGFloat(M_PI/2)))
            
            // back to center and offset
            minusPath.applyTransform(CGAffineTransformMakeTranslation((cordiW/2)+offsetX,(cordiH/2)+offsetY))
            
            
            
            //set the stroke color
            strokeColor.setStroke()
            minusPath.lineCapStyle = .Round
            //draw the stroke
            minusPath.stroke()
        }  else if tagnumber == 5 {
            //Draw Play icon
            
            let linePath = UIBezierPath()
            
            //Drawing Arrow head
            linePath.moveToPoint(CGPoint(x:cordiW/3, y:(cordiH/3)))
            linePath.addLineToPoint(CGPoint(x:(cordiW*2)/3, y:cordiH/2))
            linePath.addLineToPoint(CGPoint(x:cordiW/3, y:(cordiH*2)/3))
            
            linePath.closePath()
            //What is miterLinit? tavmjong.free.fr/SVG/MITER_LIMIT/index.html
            linePath.miterLimit = 4
            // lineCapStyle can be .Round .Square .Butt
            linePath.lineCapStyle = .Round
            linePath.usesEvenOddFillRule = true
            
            //scale
            linePath.applyTransform(CGAffineTransformMakeTranslation(-cordiW/2,-cordiH/2))
            linePath.applyTransform(CGAffineTransformMakeScale(iconScale,iconScale))
            
            // use special for rotating
            //linePath.applyTransform(CGAffineTransformMakeRotation(CGFloat(M_PI/2)))
            
            // back to center and offset
            linePath.applyTransform(CGAffineTransformMakeTranslation((cordiW/2)+offsetX,(cordiH/2)+offsetY))
            
            // fill arrow head
            strokeColor.setFill()
            linePath.fill()
            strokeColor.setStroke()
            linePath.stroke()
            
        }
        
        else if tagnumber == 6 {
            //Draw Play icon
            
            let linePath = UIBezierPath()
            //make multiple offset
            //Drawing Arrow head first
            linePath.moveToPoint(CGPoint(x:cordiW/3, y:(cordiH/3)))
            linePath.addLineToPoint(CGPoint(x:(cordiW*2)/3, y:cordiH/2))
            linePath.addLineToPoint(CGPoint(x:cordiW/3, y:(cordiH*2)/3))
            linePath.closePath()
            
            //Drawing Arrow head second
            linePath.moveToPoint(CGPoint(x:(cordiW*2)/3, y:(cordiH/3)))
            linePath.addLineToPoint(CGPoint(x:cordiW, y:cordiH/2))
            linePath.addLineToPoint(CGPoint(x:(cordiW*2)/3, y:(cordiH*2)/3))
            linePath.closePath()
            
            
            //What is miterLinit? tavmjong.free.fr/SVG/MITER_LIMIT/index.html
            linePath.miterLimit = 4
            // lineCapStyle can be .Round .Square .Butt
            linePath.lineCapStyle = .Round
            linePath.usesEvenOddFillRule = true
            
            //scale
            linePath.applyTransform(CGAffineTransformMakeTranslation(-cordiW/2,-cordiH/2))
            linePath.applyTransform(CGAffineTransformMakeScale(iconScale,iconScale))
            
            // use special for rotating
            //linePath.applyTransform(CGAffineTransformMakeRotation(CGFloat(M_PI/2)))
            
            // back to center and offset
            linePath.applyTransform(CGAffineTransformMakeTranslation((cordiW/2)+offsetX,(cordiH/2)+offsetY))
            
            // fill arrow head
            strokeColor.setFill()
            linePath.fill()
            strokeColor.setStroke()
                linePath.stroke()}
            

    }
}//end
