//
//  UIView+BoundInside.swift
//  Tipbitz
//
//  Created by Rafat Touqir Rafsun on 3/3/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit

/** BoundInside Extends UIView
 
 */
extension UIView{
    
    func boundInside(superView: UIView){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[subview]-0-|", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics:nil, views:["subview":self]))
        superView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[subview]-0-|", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics:nil, views:["subview":self]))
        
    }
    
    func addTopBorderWithColor(color:UIColor,andWidth borderWidth:CGFloat)  {
        let border = UIView()
        border.backgroundColor = color;
        border.autoresizingMask = [.FlexibleWidth , .FlexibleBottomMargin];
        border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
        self.addSubview( border )
    }
    
    func addBottomBorderWithColor(color:UIColor,andWidth borderWidth:CGFloat)  {
        let border = UIView()
        border.backgroundColor = color;
        border.autoresizingMask = [.FlexibleWidth , .FlexibleTopMargin];
        border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth)
        self.addSubview( border )
    }
    func addLeftBorderWithColor(color:UIColor,andWidth borderWidth:CGFloat)  {
        let border = UIView()
        border.backgroundColor = color;
        border.autoresizingMask = [.FlexibleHeight , .FlexibleRightMargin];
        border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height)
        self.addSubview( border )
    }
    func addRightBorderWithColor(color:UIColor,andWidth borderWidth:CGFloat)  {
        let border = UIView()
        border.backgroundColor = color;
        border.autoresizingMask = [.FlexibleHeight , .FlexibleLeftMargin];
        border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height)
        self.addSubview( border )
    }
    
    
    
}
