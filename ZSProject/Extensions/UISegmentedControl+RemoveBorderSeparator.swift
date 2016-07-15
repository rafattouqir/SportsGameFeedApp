//
//  UISegmentedControl+RemoveBorderSeparator.swift
//  PetsOfAsia
//
//  Created by Rafat Touqir Rafsun on 4/17/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit

/** RemoveBorderSeparator Extends UISegmentedControl

*/
extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(backgroundColor!), forState: .Normal, barMetrics: .Default)
        setBackgroundImage(imageWithColor(tintColor!), forState: .Selected, barMetrics: .Default)
        setDividerImage(imageWithColor(UIColor.clearColor()), forLeftSegmentState: .Normal, rightSegmentState: .Normal, barMetrics: .Default)
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image
    }
}
