//
//  Askchef.swift
//  Fiksu Timer
//
//  Created by Dr.Alf on 2016. 8. 14..
//  Copyright © 2016 Forthink. All rights reserved.
//
//
//  Generated by PaintCode Plugin for Sketch
//  http://www.paintcodeapp.com/sketch
//

import UIKit



class Askchef: NSObject {
    
    
    //MARK: - Canvas Drawings
    
    /// Page 1
    
    class func drawAskChefIcon(frame frame: CGRect = CGRect(x: 0, y: 0, width: 41, height: 41), resizing: ResizingBehavior = .AspectFit) {
        /// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        /// Resize To Frame
        CGContextSaveGState(context)
        let resizedFrame = resizing.apply(rect: CGRect(x: 0, y: 0, width: 41, height: 41), target: frame)
        CGContextTranslateCTM(context, resizedFrame.minX, resizedFrame.minY)
        let resizedScale = CGSize(width: resizedFrame.width / 41, height: resizedFrame.height / 41)
        CGContextScaleCTM(context, resizedScale.width, resizedScale.height)
        
        /// chefquestion
        do {
            CGContextSaveGState(context)
            CGContextTranslateCTM(context, 1, 1)
            
            /// Oval
            let oval = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: 40, height: 40))
            CGContextSaveGState(context)
            CGContextSetAlpha(context, 0.8)
            CGContextBeginTransparencyLayer(context, nil)
            do {
                UIColor(hue: 0.257, saturation: 0.523, brightness: 0.629, alpha: 1).setFill()
                oval.fill()
            }
            CGContextEndTransparencyLayer(context)
            CGContextRestoreGState(context)
            
            /// ?
            let layer = UIBezierPath()
            layer.moveToPoint(CGPoint(x: 1.6, y: 6.11))
            layer.addCurveToPoint(CGPoint(x: 2.32, y: 5.47), controlPoint1: CGPoint(x: 1.81, y: 5.86), controlPoint2: CGPoint(x: 2.05, y: 5.65))
            layer.addCurveToPoint(CGPoint(x: 3.17, y: 4.96), controlPoint1: CGPoint(x: 2.59, y: 5.3), controlPoint2: CGPoint(x: 2.88, y: 5.13))
            layer.addCurveToPoint(CGPoint(x: 4.04, y: 4.48), controlPoint1: CGPoint(x: 3.47, y: 4.8), controlPoint2: CGPoint(x: 3.76, y: 4.64))
            layer.addCurveToPoint(CGPoint(x: 4.82, y: 3.93), controlPoint1: CGPoint(x: 4.33, y: 4.32), controlPoint2: CGPoint(x: 4.59, y: 4.13))
            layer.addCurveToPoint(CGPoint(x: 5.37, y: 3.25), controlPoint1: CGPoint(x: 5.05, y: 3.73), controlPoint2: CGPoint(x: 5.23, y: 3.5))
            layer.addCurveToPoint(CGPoint(x: 5.58, y: 2.33), controlPoint1: CGPoint(x: 5.51, y: 2.99), controlPoint2: CGPoint(x: 5.58, y: 2.69))
            layer.addCurveToPoint(CGPoint(x: 5.41, y: 1.6), controlPoint1: CGPoint(x: 5.58, y: 2.08), controlPoint2: CGPoint(x: 5.52, y: 1.83))
            layer.addCurveToPoint(CGPoint(x: 4.97, y: 1), controlPoint1: CGPoint(x: 5.31, y: 1.37), controlPoint2: CGPoint(x: 5.16, y: 1.17))
            layer.addCurveToPoint(CGPoint(x: 4.3, y: 0.59), controlPoint1: CGPoint(x: 4.78, y: 0.82), controlPoint2: CGPoint(x: 4.56, y: 0.69))
            layer.addCurveToPoint(CGPoint(x: 3.45, y: 0.44), controlPoint1: CGPoint(x: 4.04, y: 0.49), controlPoint2: CGPoint(x: 3.76, y: 0.44))
            layer.addCurveToPoint(CGPoint(x: 2.32, y: 0.84), controlPoint1: CGPoint(x: 2.99, y: 0.44), controlPoint2: CGPoint(x: 2.62, y: 0.58))
            layer.addCurveToPoint(CGPoint(x: 1.87, y: 1.86), controlPoint1: CGPoint(x: 2.02, y: 1.11), controlPoint2: CGPoint(x: 1.87, y: 1.45))
            layer.addCurveToPoint(CGPoint(x: 2.14, y: 2.63), controlPoint1: CGPoint(x: 1.87, y: 2.13), controlPoint2: CGPoint(x: 1.96, y: 2.39))
            layer.addCurveToPoint(CGPoint(x: 2.87, y: 2.98), controlPoint1: CGPoint(x: 2.31, y: 2.86), controlPoint2: CGPoint(x: 2.56, y: 2.98))
            layer.addCurveToPoint(CGPoint(x: 3.71, y: 2.69), controlPoint1: CGPoint(x: 3.28, y: 2.98), controlPoint2: CGPoint(x: 3.56, y: 2.88))
            layer.addCurveToPoint(CGPoint(x: 3.94, y: 2.01), controlPoint1: CGPoint(x: 3.85, y: 2.5), controlPoint2: CGPoint(x: 3.93, y: 2.27))
            layer.addLineToPoint(CGPoint(x: 4.13, y: 2.01))
            layer.addCurveToPoint(CGPoint(x: 4.02, y: 2.7), controlPoint1: CGPoint(x: 4.13, y: 2.22), controlPoint2: CGPoint(x: 4.09, y: 2.45))
            layer.addCurveToPoint(CGPoint(x: 3.66, y: 3.38), controlPoint1: CGPoint(x: 3.94, y: 2.95), controlPoint2: CGPoint(x: 3.83, y: 3.17))
            layer.addCurveToPoint(CGPoint(x: 3.03, y: 3.9), controlPoint1: CGPoint(x: 3.5, y: 3.59), controlPoint2: CGPoint(x: 3.29, y: 3.76))
            layer.addCurveToPoint(CGPoint(x: 2.07, y: 4.1), controlPoint1: CGPoint(x: 2.77, y: 4.03), controlPoint2: CGPoint(x: 2.45, y: 4.1))
            layer.addCurveToPoint(CGPoint(x: 1, y: 3.71), controlPoint1: CGPoint(x: 1.65, y: 4.1), controlPoint2: CGPoint(x: 1.29, y: 3.97))
            layer.addCurveToPoint(CGPoint(x: 0.57, y: 2.69), controlPoint1: CGPoint(x: 0.71, y: 3.45), controlPoint2: CGPoint(x: 0.57, y: 3.11))
            layer.addCurveToPoint(CGPoint(x: 0.88, y: 1.69), controlPoint1: CGPoint(x: 0.57, y: 2.34), controlPoint2: CGPoint(x: 0.67, y: 2.01))
            layer.addCurveToPoint(CGPoint(x: 1.75, y: 0.83), controlPoint1: CGPoint(x: 1.08, y: 1.37), controlPoint2: CGPoint(x: 1.37, y: 1.08))
            layer.addCurveToPoint(CGPoint(x: 3.13, y: 0.23), controlPoint1: CGPoint(x: 2.12, y: 0.58), controlPoint2: CGPoint(x: 2.58, y: 0.38))
            layer.addCurveToPoint(CGPoint(x: 4.94, y: 0), controlPoint1: CGPoint(x: 3.67, y: 0.08), controlPoint2: CGPoint(x: 4.28, y: 0))
            layer.addCurveToPoint(CGPoint(x: 6.1, y: 0.15), controlPoint1: CGPoint(x: 5.37, y: 0), controlPoint2: CGPoint(x: 5.75, y: 0.05))
            layer.addCurveToPoint(CGPoint(x: 7.03, y: 0.6), controlPoint1: CGPoint(x: 6.46, y: 0.26), controlPoint2: CGPoint(x: 6.76, y: 0.41))
            layer.addCurveToPoint(CGPoint(x: 7.65, y: 1.28), controlPoint1: CGPoint(x: 7.3, y: 0.79), controlPoint2: CGPoint(x: 7.5, y: 1.02))
            layer.addCurveToPoint(CGPoint(x: 7.87, y: 2.17), controlPoint1: CGPoint(x: 7.79, y: 1.55), controlPoint2: CGPoint(x: 7.87, y: 1.84))
            layer.addCurveToPoint(CGPoint(x: 7.55, y: 3.12), controlPoint1: CGPoint(x: 7.87, y: 2.52), controlPoint2: CGPoint(x: 7.76, y: 2.84))
            layer.addCurveToPoint(CGPoint(x: 6.74, y: 3.87), controlPoint1: CGPoint(x: 7.34, y: 3.4), controlPoint2: CGPoint(x: 7.07, y: 3.65))
            layer.addCurveToPoint(CGPoint(x: 5.67, y: 4.41), controlPoint1: CGPoint(x: 6.41, y: 4.08), controlPoint2: CGPoint(x: 6.06, y: 4.26))
            layer.addCurveToPoint(CGPoint(x: 4.54, y: 4.8), controlPoint1: CGPoint(x: 5.28, y: 4.56), controlPoint2: CGPoint(x: 4.91, y: 4.69))
            layer.addCurveToPoint(CGPoint(x: 3.75, y: 5.02), controlPoint1: CGPoint(x: 4.29, y: 4.86), controlPoint2: CGPoint(x: 4.03, y: 4.94))
            layer.addCurveToPoint(CGPoint(x: 2.96, y: 5.29), controlPoint1: CGPoint(x: 3.48, y: 5.1), controlPoint2: CGPoint(x: 3.22, y: 5.19))
            layer.addCurveToPoint(CGPoint(x: 2.26, y: 5.66), controlPoint1: CGPoint(x: 2.71, y: 5.39), controlPoint2: CGPoint(x: 2.47, y: 5.52))
            layer.addCurveToPoint(CGPoint(x: 1.69, y: 6.17), controlPoint1: CGPoint(x: 2.04, y: 5.8), controlPoint2: CGPoint(x: 1.85, y: 5.97))
            layer.addLineToPoint(CGPoint(x: 1.6, y: 6.11))
            layer.closePath()
            layer.moveToPoint(CGPoint(x: 2.17, y: 7.17))
            layer.addCurveToPoint(CGPoint(x: 2.54, y: 7.9), controlPoint1: CGPoint(x: 2.42, y: 7.37), controlPoint2: CGPoint(x: 2.54, y: 7.61))
            layer.addCurveToPoint(CGPoint(x: 2.17, y: 8.63), controlPoint1: CGPoint(x: 2.54, y: 8.18), controlPoint2: CGPoint(x: 2.42, y: 8.43))
            layer.addCurveToPoint(CGPoint(x: 1.27, y: 8.93), controlPoint1: CGPoint(x: 1.92, y: 8.83), controlPoint2: CGPoint(x: 1.62, y: 8.93))
            layer.addCurveToPoint(CGPoint(x: 0.37, y: 8.63), controlPoint1: CGPoint(x: 0.92, y: 8.93), controlPoint2: CGPoint(x: 0.62, y: 8.83))
            layer.addCurveToPoint(CGPoint(x: 0, y: 7.9), controlPoint1: CGPoint(x: 0.12, y: 8.43), controlPoint2: CGPoint(x: 0, y: 8.18))
            layer.addCurveToPoint(CGPoint(x: 0.37, y: 7.17), controlPoint1: CGPoint(x: 0, y: 7.61), controlPoint2: CGPoint(x: 0.12, y: 7.37))
            layer.addCurveToPoint(CGPoint(x: 1.27, y: 6.87), controlPoint1: CGPoint(x: 0.62, y: 6.97), controlPoint2: CGPoint(x: 0.92, y: 6.87))
            layer.addCurveToPoint(CGPoint(x: 2.17, y: 7.17), controlPoint1: CGPoint(x: 1.62, y: 6.87), controlPoint2: CGPoint(x: 1.92, y: 6.97))
            layer.closePath()
            layer.moveToPoint(CGPoint(x: 2.17, y: 7.17))
            CGContextSaveGState(context)
            CGContextTranslateCTM(context, 20.89, 27.1)
            CGContextRotateCTM(context, 347 * CGFloat(M_PI/180))
            CGContextTranslateCTM(context, -3.93, -4.47)
            layer.usesEvenOddFillRule = true
            UIColor(white: 1, alpha: 0.9).setFill()
            layer.fill()
            CGContextRestoreGState(context)
            
            /// Combined Shape
            let combinedShape = UIBezierPath()
            combinedShape.moveToPoint(CGPoint(x: 5.23, y: 9.64))
            combinedShape.addCurveToPoint(CGPoint(x: 0.02, y: 6.91), controlPoint1: CGPoint(x: 5.23, y: 9.64), controlPoint2: CGPoint(x: 0.26, y: 9.65))
            combinedShape.addCurveToPoint(CGPoint(x: 3.35, y: 3.02), controlPoint1: CGPoint(x: -0.21, y: 4.17), controlPoint2: CGPoint(x: 1.48, y: 3.28))
            combinedShape.addCurveToPoint(CGPoint(x: 11.82, y: 1.71), controlPoint1: CGPoint(x: 5.23, y: 2.77), controlPoint2: CGPoint(x: 9.1, y: 2.78))
            combinedShape.addCurveToPoint(CGPoint(x: 18.86, y: 0.23), controlPoint1: CGPoint(x: 14.55, y: 0.64), controlPoint2: CGPoint(x: 16.58, y: -0.49))
            combinedShape.addCurveToPoint(CGPoint(x: 21.43, y: 4.81), controlPoint1: CGPoint(x: 21.13, y: 0.95), controlPoint2: CGPoint(x: 22.83, y: 2.87))
            combinedShape.addCurveToPoint(CGPoint(x: 18.84, y: 7.18), controlPoint1: CGPoint(x: 20.02, y: 6.74), controlPoint2: CGPoint(x: 18.84, y: 7.18))
            combinedShape.addLineToPoint(CGPoint(x: 18.76, y: 11.9))
            combinedShape.addCurveToPoint(CGPoint(x: 12.49, y: 11.45), controlPoint1: CGPoint(x: 18.76, y: 11.9), controlPoint2: CGPoint(x: 17.72, y: 11.45))
            combinedShape.addCurveToPoint(CGPoint(x: 5.19, y: 11.87), controlPoint1: CGPoint(x: 7.26, y: 11.45), controlPoint2: CGPoint(x: 5.19, y: 11.87))
            combinedShape.addLineToPoint(CGPoint(x: 5.23, y: 9.64))
            combinedShape.closePath()
            combinedShape.moveToPoint(CGPoint(x: 5.26, y: 8.12))
            combinedShape.addLineToPoint(CGPoint(x: 5.31, y: 9.1))
            combinedShape.addCurveToPoint(CGPoint(x: 1.15, y: 6.6), controlPoint1: CGPoint(x: 5.31, y: 9.1), controlPoint2: CGPoint(x: 0.96, y: 9.53))
            combinedShape.addCurveToPoint(CGPoint(x: 6.92, y: 3.71), controlPoint1: CGPoint(x: 1.33, y: 3.66), controlPoint2: CGPoint(x: 6.92, y: 3.71))
            combinedShape.addCurveToPoint(CGPoint(x: 13.3, y: 2.69), controlPoint1: CGPoint(x: 6.92, y: 3.71), controlPoint2: CGPoint(x: 11.27, y: 3.34))
            combinedShape.addCurveToPoint(CGPoint(x: 19.6, y: 1.94), controlPoint1: CGPoint(x: 15.34, y: 2.04), controlPoint2: CGPoint(x: 17.85, y: 0.59))
            combinedShape.addCurveToPoint(CGPoint(x: 17.57, y: 6.1), controlPoint1: CGPoint(x: 21.36, y: 3.3), controlPoint2: CGPoint(x: 19.89, y: 5.96))
            combinedShape.addCurveToPoint(CGPoint(x: 18.91, y: 3.19), controlPoint1: CGPoint(x: 18.36, y: 4.96), controlPoint2: CGPoint(x: 18.91, y: 3.95))
            combinedShape.addCurveToPoint(CGPoint(x: 15.18, y: 6.3), controlPoint1: CGPoint(x: 18.06, y: 4.54), controlPoint2: CGPoint(x: 17.72, y: 6))
            combinedShape.addCurveToPoint(CGPoint(x: 15.54, y: 3.84), controlPoint1: CGPoint(x: 16.7, y: 4.43), controlPoint2: CGPoint(x: 15.54, y: 3.84))
            combinedShape.addCurveToPoint(CGPoint(x: 12.72, y: 6.46), controlPoint1: CGPoint(x: 15.54, y: 3.84), controlPoint2: CGPoint(x: 15.79, y: 6.33))
            combinedShape.addCurveToPoint(CGPoint(x: 12.11, y: 4.84), controlPoint1: CGPoint(x: 11.74, y: 5.26), controlPoint2: CGPoint(x: 12.11, y: 4.84))
            combinedShape.addCurveToPoint(CGPoint(x: 10.7, y: 6.51), controlPoint1: CGPoint(x: 12.11, y: 4.84), controlPoint2: CGPoint(x: 11.6, y: 6.51))
            combinedShape.addCurveToPoint(CGPoint(x: 8.72, y: 5.61), controlPoint1: CGPoint(x: 9.8, y: 6.51), controlPoint2: CGPoint(x: 9.27, y: 6.39))
            combinedShape.addCurveToPoint(CGPoint(x: 9.17, y: 6.77), controlPoint1: CGPoint(x: 8.87, y: 6.51), controlPoint2: CGPoint(x: 9.17, y: 6.77))
            combinedShape.addCurveToPoint(CGPoint(x: 6.05, y: 7.26), controlPoint1: CGPoint(x: 9.17, y: 6.77), controlPoint2: CGPoint(x: 7.55, y: 7.49))
            combinedShape.addCurveToPoint(CGPoint(x: 2.46, y: 6.42), controlPoint1: CGPoint(x: 4.54, y: 7.03), controlPoint2: CGPoint(x: 2.87, y: 6.75))
            combinedShape.addCurveToPoint(CGPoint(x: 5.37, y: 7.69), controlPoint1: CGPoint(x: 4.15, y: 7.26), controlPoint2: CGPoint(x: 5.37, y: 7.69))
            combinedShape.addLineToPoint(CGPoint(x: 5.26, y: 8.12))
            combinedShape.closePath()
            combinedShape.moveToPoint(CGPoint(x: 6.52, y: 10.71))
            combinedShape.addLineToPoint(CGPoint(x: 6.5, y: 7.69))
            combinedShape.addCurveToPoint(CGPoint(x: 9.44, y: 7.03), controlPoint1: CGPoint(x: 6.5, y: 7.69), controlPoint2: CGPoint(x: 8.41, y: 7.38))
            combinedShape.addCurveToPoint(CGPoint(x: 11.3, y: 7.48), controlPoint1: CGPoint(x: 10.36, y: 7.69), controlPoint2: CGPoint(x: 10.89, y: 7.65))
            combinedShape.addCurveToPoint(CGPoint(x: 12.23, y: 6.86), controlPoint1: CGPoint(x: 11.7, y: 7.31), controlPoint2: CGPoint(x: 12.23, y: 6.86))
            combinedShape.addCurveToPoint(CGPoint(x: 13.51, y: 7.38), controlPoint1: CGPoint(x: 12.23, y: 6.86), controlPoint2: CGPoint(x: 12.72, y: 7.38))
            combinedShape.addCurveToPoint(CGPoint(x: 14.67, y: 6.92), controlPoint1: CGPoint(x: 14.29, y: 7.38), controlPoint2: CGPoint(x: 14.67, y: 6.92))
            combinedShape.addCurveToPoint(CGPoint(x: 15.77, y: 7.3), controlPoint1: CGPoint(x: 14.67, y: 6.92), controlPoint2: CGPoint(x: 15.08, y: 7.46))
            combinedShape.addCurveToPoint(CGPoint(x: 16.76, y: 6.79), controlPoint1: CGPoint(x: 16.46, y: 7.14), controlPoint2: CGPoint(x: 16.76, y: 6.79))
            combinedShape.addCurveToPoint(CGPoint(x: 17.59, y: 7), controlPoint1: CGPoint(x: 16.76, y: 6.79), controlPoint2: CGPoint(x: 17.27, y: 7.21))
            combinedShape.addCurveToPoint(CGPoint(x: 17.76, y: 10.81), controlPoint1: CGPoint(x: 17.9, y: 6.79), controlPoint2: CGPoint(x: 17.76, y: 10.81))
            combinedShape.addCurveToPoint(CGPoint(x: 12.16, y: 10.43), controlPoint1: CGPoint(x: 17.76, y: 10.81), controlPoint2: CGPoint(x: 14.6, y: 10.43))
            combinedShape.addCurveToPoint(CGPoint(x: 6.52, y: 10.71), controlPoint1: CGPoint(x: 9.72, y: 10.43), controlPoint2: CGPoint(x: 6.52, y: 10.71))
            combinedShape.closePath()
            combinedShape.moveToPoint(CGPoint(x: 6.52, y: 10.71))
            CGContextSaveGState(context)
            CGContextTranslateCTM(context, 8.02, 7.03)
            combinedShape.usesEvenOddFillRule = true
            UIColor(white: 1, alpha: 0.9).setFill()
            combinedShape.fill()
            CGContextRestoreGState(context)
            
            CGContextRestoreGState(context)
        }
        
        CGContextRestoreGState(context)
    }
    
    
    //MARK: - Canvas Images
    
    /// Page 1
    
    class func imageOfAskChefIcon(size size: CGSize = CGSize(width: 41, height: 41), resizing: ResizingBehavior = .AspectFit) -> UIImage {
        var image: UIImage
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        Askchef.drawAskChefIcon(frame: CGRect(origin: CGPoint.zero, size: size), resizing: resizing)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
    //MARK: - Resizing Behavior
    
    enum ResizingBehavior {
        case AspectFit /// The content is proportionally resized to fit into the target rectangle.
        case AspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case Stretch /// The content is stretched to match the entire target rectangle.
        case Center /// The content is centered in the target rectangle, but it is NOT resized.
        
        func apply(rect rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }
            
            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)
            
            switch self {
                case .AspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .AspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .Stretch:
                    break
                case .Center:
                    scales.width = 1
                    scales.height = 1
            }
            
            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
    
    
}