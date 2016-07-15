//
//  UIButton+ImageTitlePositioning.swift
//  Boatlah
//
//  Created by Rafat Touqir Rafsun on 4/24/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit

/** ImageTitlePositioning Extends UIButton

*/
extension UIButton {
    
    //    This method sets an image and title for a UIButton and
    //    repositions the titlePosition with respect to the button image.
    //    Add additionalSpacing between the button image & title as required
    //    For titlePosition, the function only respects UIViewContentModeTop, UIViewContentModeBottom, UIViewContentModeLeft and UIViewContentModeRight
    //    All other titlePositions are ignored
    func set(image anImage: UIImage?, title: String?, titlePosition: UIViewContentMode, additionalSpacing: CGFloat, state: UIControlState){
        self.imageView?.contentMode = .Center
        self.setImage(anImage, forState: state)
        
        positionLabelRespectToImage(title!, position: titlePosition, spacing: additionalSpacing)
        
        self.titleLabel?.contentMode = .Center
        self.setTitle(title, forState: state)
    }
    
    //currently using this for button top image/bottom title
    
    func alignImageAndTitleVertically(padding padding: CGFloat = 2) {
        let imageSize = self.imageView?.frame.size
        
        let titleLabelASNSString:NSString? = self.titleLabel?.text
        
        // this titleSize won't work, and for this reason image will not be centered
        // to work properly get titlesize from label.text.size
        
        //        let titleSize = self.titleLabel?.frame.size
        let titleSize = titleLabelASNSString?.sizeWithAttributes([NSFontAttributeName:self.titleLabel!.font])
        
        let totalHeight: CGFloat = ((imageSize!.height) + (titleSize!.height) + padding)
        self.imageEdgeInsets = UIEdgeInsets(
            top: -(totalHeight-imageSize!.height), left: 0.0, bottom: 0.0, right: -titleSize!.width
        )
        
        //if any problem then remove topInsetManual
        let topInsetManual:CGFloat = 8
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0.0, left: -imageSize!.width, bottom: -(totalHeight-titleSize!.height - topInsetManual), right: 0.0
        )
    }
    
    
    
    func centerLabelVerticallyWithPadding(padding spacing:CGFloat) {
        // update positioning of image and title
        
        
        
        let imageSize = self.imageView?.frame.size
        
        if let imageSize = imageSize{
        self.titleEdgeInsets = UIEdgeInsets(top:0,
                                            left:-imageSize.width,
                                            bottom:-(imageSize.height + spacing),
                                            right:0)
        }
        
        
        let titleSize = self.titleLabel?.frame.size
        
        if let titleSize = titleSize{
        self.imageEdgeInsets = UIEdgeInsets(top:-(titleSize.height + spacing),
                                            left:0,
                                            bottom: 0,
                                            right:-titleSize.width)
        }
        // reset contentInset, so intrinsicContentSize() is still accurate
        let trueContentSize = CGRectUnion(self.titleLabel?.frame ?? CGRectZero, self.imageView?.frame ?? CGRectZero).size
        let oldContentSize = self.intrinsicContentSize()
        let heightDelta = trueContentSize.height - oldContentSize.height
        let widthDelta = trueContentSize.width - oldContentSize.width
        self.contentEdgeInsets = UIEdgeInsets(top:heightDelta/2.0,
                                              left:widthDelta/2.0,
                                              bottom:heightDelta/2.0,
                                              right:widthDelta/2.0)
    }
    
    private func positionLabelRespectToImage(title: String, position: UIViewContentMode, spacing: CGFloat) {
        let imageSize = self.imageRectForContentRect(self.frame)
        let titleFont = self.titleLabel?.font!
        let titleSize = title.sizeWithAttributes([NSFontAttributeName: titleFont!])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .Top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing), left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .Bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing), left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .Left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -(titleSize.width * 2 + spacing))
        case .Right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}
