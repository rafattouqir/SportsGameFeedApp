//
//  UIImage+UISegmentIconAndText.swift
//  PetsOfAsia
//
//  Created by Rafat Touqir Rafsun on 4/5/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit

/** UISegmentIconAndText Extends UIImage
 
 */
extension UIImage {
    
    
    func UISegmentIconAndTextAsImage(title title:String ,color:UIColor,font fontP:UIFont?,textSize:CGFloat = 16) -> UIImage{
        
        let font = fontP ?? UIFont.systemFontOfSize(textSize)
        let myString: NSString = title as NSString
        let fontAttributes = [NSFontAttributeName: font,NSForegroundColorAttributeName:color]
        let expectedTextSize: CGSize = myString.sizeWithAttributes(fontAttributes)
        
        let width = max(expectedTextSize.width , self.size.width )
        let height = expectedTextSize.height + self.size.width + 5
        let size = CGSizeMake(width,height);
        UIGraphicsBeginImageContextWithOptions(size, false, self.scale)
        let context = UIGraphicsGetCurrentContext();
       
        
        let fontTopPosition = (width - expectedTextSize.width) / 2;
        let textPoint = CGPointMake(fontTopPosition ,self.size.height );
        
        
        myString.drawAtPoint(textPoint, withAttributes: fontAttributes)
        // Images upside down so flip them
        let flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, size.height-5);
        CGContextConcatCTM(context, flipVertical);
        CGContextSetBlendMode(context, .Normal);
        let rect = CGRect(x: (width - self.size.width) / 2, y: (height - self.size.height+5) / 2, width: self.size.width, height: self.size.height )
        CGContextClipToMask(context, rect, self.CGImage);
        color.setFill()
        CGContextFillRect(context, rect);
        
        
//        // horizontal Text
//        let width = expectedTextSize.width + self.size.width + 5;
//        let height = max(expectedTextSize.height, self.size.width);
//        let size = CGSizeMake(width,height);
//        UIGraphicsBeginImageContextWithOptions(size, false, 0)
//        let context = UIGraphicsGetCurrentContext();
//        CGContextSetFillColorWithColor(context, color.CGColor);
//        let fontTopPosition = (height - expectedTextSize.height) / 2;
//        let textPoint = CGPointMake(self.size.width + 5, fontTopPosition);
//        
//        
//        myString.drawAtPoint(textPoint, withAttributes: fontAttributes)
//        // Images upside down so flip them
//        let flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, size.height);
//        CGContextConcatCTM(context, flipVertical);
//        CGContextDrawImage(context, CGRect(x: 0, y: (height - self.size.height) / 2, width: self.size.width, height: self.size.height ), self.CGImage)
        
        
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    }
}
