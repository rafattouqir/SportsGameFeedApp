//
//  UIBezierPath+ImageDraw.swift
//  Tipbitz
//
//  Created by Rafat Touqir Rafsun on 3/2/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit

/** ImageDraw Extends UIBezierPath

*/
extension UIBezierPath {
    
    /** Returns an image of the path drawn using a stroke */
    func strokeImageWithColor(strokeColor: UIColor?, fillColor: UIColor?) -> UIImage {
        
        var strokeColor = strokeColor
        var fillColor = strokeColor

        // get your bounds
        let bounds: CGRect = self.bounds
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(bounds.size.width + self.lineWidth * 2, bounds.size.width + self.lineWidth * 2), false, UIScreen.mainScreen().scale)
        
        // get reference to the graphics context
        let reference: CGContextRef = UIGraphicsGetCurrentContext()!
        
        // translate matrix so that path will be centered in bounds
        CGContextTranslateCTM(reference, self.lineWidth, self.lineWidth)
        
        
        if strokeColor == nil {
            strokeColor = fillColor!;
        }
        else if fillColor == nil {
            fillColor = strokeColor!;
        }
        
        // set the color
        fillColor?.setFill()
        strokeColor?.setStroke()
        
        // draw the path
        fill()
        stroke()
        
        
        // grab an image of the context
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
}

