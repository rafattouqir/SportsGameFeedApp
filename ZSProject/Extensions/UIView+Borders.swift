//
//  UIView+Borders.swift
//  TipBitz
//
//  Created by Rafat Touqir Rafsun on 4/11/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit


extension UIView {
    
    //////////
    // Top
    //////////
    func createTopBorderWithHeight(height: CGFloat, andColor color: UIColor) -> CALayer {
        return self.getOneSidedBorderWithFrame(CGRectMake(0, 0, self.frame.size.width, height), andColor: color)
    }
    
    func createViewBackedTopBorderWithHeight(height: CGFloat, andColor color: UIColor) -> UIView {
        return self.getViewBackedOneSidedBorderWithFrame(CGRectMake(0, 0, self.frame.size.width, height), andColor: color)
    }
    
    func addTopBorderWithHeight(height: CGFloat, andColor color: UIColor) {
        self.addOneSidedBorderWithFrame(CGRectMake(0, 0, self.frame.size.width, height), andColor: color)
    }
    
    func addViewBackedTopBorderWithHeight(height: CGFloat, andColor color: UIColor) {
        self.addViewBackedOneSidedBorderWithFrame(CGRectMake(0, 0, self.frame.size.width, height), andColor: color)
    }
    
    //////////
    // Top + Offset
    //////////
    func createTopBorderWithHeight(height: CGFloat, color: UIColor, leftOffset: CGFloat, rightOffset: CGFloat, andTopOffset topOffset: CGFloat) -> CALayer {
        // Subtract the bottomOffset from the height and the thickness to get our final y position.
        // Add a left offset to our x to get our x position.
        // Minus our rightOffset and negate the leftOffset from the width to get our endpoint for the border.
        return self.getOneSidedBorderWithFrame(CGRectMake(0+leftOffset, 0+topOffset, self.frame.size.width-leftOffset-rightOffset, height), andColor: color)
    }
    
    func createViewBackedTopBorderWithHeight(height: CGFloat,  color: UIColor,  leftOffset: CGFloat,  rightOffset: CGFloat, andTopOffset topOffset: CGFloat) -> UIView {
        return self.getViewBackedOneSidedBorderWithFrame(CGRectMake(0+leftOffset, 0+topOffset, self.frame.size.width-leftOffset-rightOffset, height), andColor: color)
    }
    
    func addTopBorderWithHeight(height: CGFloat,  color: UIColor,  leftOffset: CGFloat,  rightOffset: CGFloat, andTopOffset topOffset: CGFloat) {
        // Add leftOffset to our X to get start X position.
        // Add topOffset to Y to get start Y position
        // Subtract left offset from width to negate shifting from leftOffset.
        // Subtract rightoffset from width to set end X and Width.
        self.addOneSidedBorderWithFrame(CGRectMake(0+leftOffset, 0+topOffset, self.frame.size.width-leftOffset-rightOffset, height), andColor: color)
    }
    
    func addViewBackedTopBorderWithHeight(height: CGFloat,  color: UIColor,  leftOffset: CGFloat,  rightOffset: CGFloat, andTopOffset topOffset: CGFloat) {
        self.addViewBackedOneSidedBorderWithFrame(CGRectMake(0+leftOffset, 0+topOffset, self.frame.size.width-leftOffset-rightOffset, height), andColor: color)
    }
    
    //////////
    // Right
    //////////
    func createRightBorderWithWidth(width: CGFloat, andColor color: UIColor) -> CALayer {
        return self.getOneSidedBorderWithFrame(CGRectMake(self.frame.size.width-width, 0, width, self.frame.size.height), andColor: color)
    }
    
    func createViewBackedRightBorderWithWidth(width: CGFloat, andColor color: UIColor) -> UIView {
        return self.getViewBackedOneSidedBorderWithFrame(CGRectMake(self.frame.size.width-width, 0, width, self.frame.size.height), andColor: color)
    }
    
    func addRightBorderWithWidth(width: CGFloat, andColor color: UIColor) {
        self.addOneSidedBorderWithFrame(CGRectMake(self.frame.size.width-width, 0, width, self.frame.size.height), andColor: color)
    }
    
    func addViewBackedRightBorderWithWidth(width: CGFloat, andColor color: UIColor) {
        self.addViewBackedOneSidedBorderWithFrame(CGRectMake(self.frame.size.width-width, 0, width, self.frame.size.height), andColor: color)
    }
    
    //////////
    // Right + Offset
    //////////
    func createRightBorderWithWidth(width: CGFloat,  color: UIColor,  rightOffset: CGFloat,  topOffset: CGFloat, andBottomOffset bottomOffset: CGFloat) -> CALayer {
        // Subtract bottomOffset from the height to get our end.
        return self.getOneSidedBorderWithFrame(CGRectMake(self.frame.size.width-width-rightOffset, 0+topOffset, width, self.frame.size.height-topOffset-bottomOffset), andColor: color)
    }
    
    func createViewBackedRightBorderWithWidth(width: CGFloat,  color: UIColor,  rightOffset: CGFloat,  topOffset: CGFloat, andBottomOffset bottomOffset: CGFloat) -> UIView {
        return self.getViewBackedOneSidedBorderWithFrame(CGRectMake(self.frame.size.width-width-rightOffset, 0+topOffset, width, self.frame.size.height-topOffset-bottomOffset), andColor: color)
    }
    
    func addRightBorderWithWidth(width: CGFloat,  color: UIColor,  rightOffset: CGFloat,  topOffset: CGFloat, andBottomOffset bottomOffset: CGFloat) {
        // Subtract the rightOffset from our width + thickness to get our final x position.
        // Add topOffset to our y to get our start y position.
        // Subtract topOffset from our height, so our border doesn't extend past teh view.
        // Subtract bottomOffset from the height to get our end.
        self.addOneSidedBorderWithFrame(CGRectMake(self.frame.size.width-width-rightOffset, 0+topOffset, width, self.frame.size.height-topOffset-bottomOffset), andColor: color)
    }
    
    func addViewBackedRightBorderWithWidth(width: CGFloat,  color: UIColor,  rightOffset: CGFloat,  topOffset: CGFloat, andBottomOffset bottomOffset: CGFloat) {
        self.addViewBackedOneSidedBorderWithFrame(CGRectMake(self.frame.size.width-width-rightOffset, 0+topOffset, width, self.frame.size.height-topOffset-bottomOffset), andColor: color)
    }
    
    //////////
    // Bottom
    //////////
    func createBottomBorderWithHeight(height: CGFloat, andColor color: UIColor) -> CALayer {
        return self.getOneSidedBorderWithFrame(CGRectMake(0, self.frame.size.height-height, self.frame.size.width, height), andColor: color)
    }
    
    func createViewBackedBottomBorderWithHeight(height: CGFloat, andColor color: UIColor) -> UIView {
        return self.getViewBackedOneSidedBorderWithFrame(CGRectMake(0, self.frame.size.height-height, self.frame.size.width, height), andColor: color)
    }
    
    func addBottomBorderWithHeight(height: CGFloat, andColor color: UIColor) {
        self.addOneSidedBorderWithFrame(CGRectMake(0, self.frame.size.height-height, self.frame.size.width, height), andColor: color)
    }
    
    func addViewBackedBottomBorderWithHeight(height: CGFloat, andColor color: UIColor) {
        self.addViewBackedOneSidedBorderWithFrame(CGRectMake(0, self.frame.size.height-height, self.frame.size.width, height), andColor: color)
    }
    
    //////////
    // Bottom + Offset
    //////////
    func createBottomBorderWithHeight(height: CGFloat,  color: UIColor,  leftOffset: CGFloat,  rightOffset: CGFloat, andBottomOffset bottomOffset: CGFloat) -> CALayer {
        // Subtract the bottomOffset from the height and the thickness to get our final y position.
        // Add a left offset to our x to get our x position.
        // Minus our rightOffset and negate the leftOffset from the width to get our endpoint for the border.
        return self.getOneSidedBorderWithFrame(CGRectMake(0+leftOffset, self.frame.size.height-height-bottomOffset, self.frame.size.width-leftOffset-rightOffset, height), andColor: color)
    }
    
    func createViewBackedBottomBorderWithHeight(height: CGFloat,  color: UIColor,  leftOffset: CGFloat,  rightOffset: CGFloat, andBottomOffset bottomOffset: CGFloat) -> UIView {
        return self.getViewBackedOneSidedBorderWithFrame(CGRectMake(0+leftOffset, self.frame.size.height-height-bottomOffset, self.frame.size.width-leftOffset-rightOffset, height), andColor: color)
    }
    
    func addBottomBorderWithHeight(height: CGFloat,  color: UIColor,  leftOffset: CGFloat,  rightOffset: CGFloat, andBottomOffset bottomOffset: CGFloat) {
        // Subtract the bottomOffset from the height and the thickness to get our final y position.
        // Add a left offset to our x to get our x position.
        // Minus our rightOffset and negate the leftOffset from the width to get our endpoint for the border.
        self.addOneSidedBorderWithFrame(CGRectMake(0+leftOffset, self.frame.size.height-height-bottomOffset, self.frame.size.width-leftOffset-rightOffset, height), andColor: color)
    }
    
    func addViewBackedBottomBorderWithHeight(height: CGFloat,  color: UIColor,  leftOffset: CGFloat,  rightOffset: CGFloat, andBottomOffset bottomOffset: CGFloat) {
        self.addViewBackedOneSidedBorderWithFrame(CGRectMake(0+leftOffset, self.frame.size.height-height-bottomOffset, self.frame.size.width-leftOffset-rightOffset, height), andColor: color)
    }
    
    //////////
    // Left
    //////////
    func createLeftBorderWithWidth(width: CGFloat, andColor color: UIColor) -> CALayer {
        return self.getOneSidedBorderWithFrame(CGRectMake(0, 0, width, self.frame.size.height), andColor: color)
    }
    
    func createViewBackedLeftBorderWithWidth(width: CGFloat, andColor color: UIColor) -> UIView {
        return self.getViewBackedOneSidedBorderWithFrame(CGRectMake(0, 0, width, self.frame.size.height), andColor: color)
    }
    
    func addLeftBorderWithWidth(width: CGFloat, andColor color: UIColor) {
        self.addOneSidedBorderWithFrame(CGRectMake(0, 0, width, self.frame.size.height), andColor: color)
    }
    
    func addViewBackedLeftBorderWithWidth(width: CGFloat, andColor color: UIColor) {
        self.addViewBackedOneSidedBorderWithFrame(CGRectMake(0, 0, width, self.frame.size.height), andColor: color)
    }
    
    //////////
    // Left + Offset
    //////////
    func createLeftBorderWithWidth(width: CGFloat,  color: UIColor,  leftOffset: CGFloat,  topOffset: CGFloat, andBottomOffset bottomOffset: CGFloat) -> CALayer {
        return self.getOneSidedBorderWithFrame(CGRectMake(0+leftOffset, 0+topOffset, width, self.frame.size.height-topOffset-bottomOffset), andColor: color)
    }
    
    func createViewBackedLeftBorderWithWidth(width: CGFloat,  color: UIColor,  leftOffset: CGFloat,  topOffset: CGFloat, andBottomOffset bottomOffset: CGFloat) -> UIView {
        return self.getViewBackedOneSidedBorderWithFrame(CGRectMake(0+leftOffset, 0+topOffset, width, self.frame.size.height-topOffset-bottomOffset), andColor: color)
    }
    
    func addLeftBorderWithWidth(width: CGFloat,  color: UIColor,  leftOffset: CGFloat,  topOffset: CGFloat, andBottomOffset bottomOffset: CGFloat) {
        self.addOneSidedBorderWithFrame(CGRectMake(0+leftOffset, 0+topOffset, width, self.frame.size.height-topOffset-bottomOffset), andColor: color)
    }
    
    func addViewBackedLeftBorderWithWidth(width: CGFloat,  color: UIColor,  leftOffset: CGFloat,  topOffset: CGFloat, andBottomOffset bottomOffset: CGFloat) {
        self.addViewBackedOneSidedBorderWithFrame(CGRectMake(0+leftOffset, 0+topOffset, width, self.frame.size.height-topOffset-bottomOffset), andColor: color)
    }
    
    //////////
    // Private: Our methods call these to add their borders.
    //////////
    func addOneSidedBorderWithFrame(frame: CGRect, andColor color: UIColor) {
        let border: CALayer = CALayer()
        border.frame = frame
        border.backgroundColor = color.CGColor
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func getOneSidedBorderWithFrame(frame: CGRect, andColor color: UIColor) -> CALayer {
        let border: CALayer = CALayer()
        border.frame = frame
        border.backgroundColor = color.CGColor
        return border
    }
    
    func addViewBackedOneSidedBorderWithFrame(frame: CGRect, andColor color: UIColor) {
        let border: UIView = UIView(frame: frame)
        border.backgroundColor = color
        self.addSubview(border)
    }
    
    func getViewBackedOneSidedBorderWithFrame(frame: CGRect, andColor color: UIColor) -> UIView {
        let border: UIView = UIView(frame: frame)
        border.backgroundColor = color
        return border
    }
    
}


