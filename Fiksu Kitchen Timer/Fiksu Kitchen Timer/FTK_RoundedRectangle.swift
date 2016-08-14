//
//  FTK_RoundedSquare.swift
//  FiksuCalculator
//
//  Created by donghoon bae on 2016. 7. 16..
//  Copyright © 2016년 Forethink. All rights reserved.
//
import UIKit

@IBDesignable

// Code for making universal button design


class FtkSquareBtn: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor(red: 50/255, green: 65/255, blue: 140/255, alpha: 0.7)
    @IBInspectable var strokeColor: UIColor = UIColor.whiteColor()
    @IBInspectable var radius: CGSize = CGSizeMake(8, 8)
    
    override func drawRect(rect: CGRect) {
        
        let rect = CGRect(x: 0, y: 0, width:bounds.width-5, height:bounds.height)
        
        let squarePath : UIBezierPath = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: radius)
        
        //strokeColor.setStroke()
        //squarePath.stroke()
        fillColor.setFill()
        squarePath.fill()
    }
    
}