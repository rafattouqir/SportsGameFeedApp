//
//  Utils.swift
//  Tipbitz
//
//  Created by Rafat Touqir Rafsun on 2/23/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit
import SystemConfiguration


struct Utils {
    
    static let borderWidth:CGFloat = 1
    static let cornerRadius:CGFloat = 4
    static let borderColor = UIColor.whiteColor()
    
    
    
    
    static let OnboardPageSize = 3
    static let gifLoaderSizeFactor:CGFloat = 4 // factor for gif to reduce from its original size
    static let colorLightBlue = UIColor(hexString: "#66C1DE")//light blue
    static let colorLightYellow = UIColor(hexString: "#efdd65")//light yellow
    static let colorDeepBlue = UIColor(hexString: "#0E2579")//blue deep color
    static let colorDeepBlueMenuBackground = UIColor(hexString: "#003cb4")//blue deep color
//    static let colorLightOrange = UIColor(hexString: "#fb8524")//blue deep color
    static let colorDeepBlueFactor:CGFloat = 0.7 //blue deep color transparency factor
    
    static let crossImage = Utils.barButtonImage(UIColor.whiteColor(),size: CGSize(width: 200,height: 200)).imageRotatedByDegrees(45, flip: false)
    
    static var proPicPromoText = "Choose a profile photo to customize your own TipBitz learning experience"
    static var currentProPic :UIImage?
    
    
    
    static let borderGapHeight:CGFloat = 2
    static let cornerRadiusForCollectionCell:CGFloat = 8
    
    static let timeoutColorAnimationProPicButton = 0.2
    static let timeout = 0.2
    
    
    
    
    static func buttonLeftTitleRightImage(button:UIButton){
        button.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        button.titleLabel?.transform = CGAffineTransformMakeScale(-1.0, 1.0)
        button.imageView?.transform = CGAffineTransformMakeScale(-1.0, 1.0)
        
    }
    
    
    
    static func callNumber(phoneNumber:String) {
        
        if let phoneCallURL:NSURL = NSURL(string:"telprompt://\(phoneNumber)") {
            let application:UIApplication = UIApplication.sharedApplication()
            if (application.canOpenURL(phoneCallURL)) {
                application.openURL(phoneCallURL);
            }else{
                if let fallbackPhoneCallURL = NSURL(string:"tel://\(phoneNumber)"){
                    let application:UIApplication = UIApplication.sharedApplication()
                    if (application.canOpenURL(fallbackPhoneCallURL)) {
                        application.openURL(fallbackPhoneCallURL);
                    }
                }
            }
        }
    }
    static func openWebURL(url:String) {
        
        var url = url
        if !url.hasPrefix("http://"){
            url = "http://".stringByAppendingString(url)
        }
        if let webURL:NSURL = NSURL(string:url) {
            let application:UIApplication = UIApplication.sharedApplication()
            if (application.canOpenURL(webURL)) {
                application.openURL(webURL);
            }else{
                
            }
        }
    }
    static func openMailURL(url:String) {
        
        var url = url
            url = "mailto:".stringByAppendingString(url)
        if let webURL:NSURL = NSURL(string:url) {
            let application:UIApplication = UIApplication.sharedApplication()
            if (application.canOpenURL(webURL)) {
                application.openURL(webURL);
            }else{
                
            }
        }
    }
    
    static func scaleImage(imageToScale:UIImage,newSize:CGSize) -> UIImage{
        
        
        
        var width: CGFloat = newSize.width
        var height: CGFloat = newSize.height
        UIGraphicsBeginImageContext(newSize)
        var rect: CGRect = CGRectMake(0, 0, width, height)
        let widthRatio: CGFloat = imageToScale.size.width/width
        let heightRatio: CGFloat = imageToScale.size.height/height
        let divisor: CGFloat = widthRatio > heightRatio ? widthRatio : heightRatio
        width = imageToScale.size.width/divisor
        height = imageToScale.size.height/divisor
        rect.size.width = width
        rect.size.height = height
        //indent in case of width or height difference
        let offset: CGFloat = (width-height)/2
        if offset > 0 {
            rect.origin.y = offset
        } else {
            rect.origin.x = -offset
            
        }
        imageToScale.drawInRect(rect)
        let smallImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return smallImage

        
        
    }
    
    
    static func isValidEmail(testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    
    static func customizedButtonUnderLined(inout mainButton button:UIButton,withText:String,withColor:UIColor?){
        
        let color = withColor ?? colorLightYellow!
        
        //For button underline of skip
        let attrs = [
            NSFontAttributeName : UIFont.systemFontOfSize(button.titleLabel?.font.pointSize ?? 19),
            NSForegroundColorAttributeName : color,
            NSUnderlineStyleAttributeName : NSUnderlineStyle.StyleSingle.rawValue]
        let onboardSkipAttrStr = NSMutableAttributedString(string:"")
        let buttonTitleStr = NSMutableAttributedString(string:withText, attributes:attrs)
        onboardSkipAttrStr.appendAttributedString(buttonTitleStr)
        button.setAttributedTitle(onboardSkipAttrStr, forState: .Normal)
        
    }
    
    static func imageWithColor(color:UIColor,size:CGSize)->UIImage {
        let rect = CGRectMake(0, 0,size.width,size.height)
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
    }
    static func barButtonImage(color:UIColor,size:CGSize = CGSize(width: 45,height: 45))->UIImage {
        let bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let plusWidth = CGFloat(min(bounds.width, bounds.height))
        let plusBezierPath = UIBezierPath()
        plusBezierPath.lineWidth = 6
        //move the initial point of the path
        //to the start of the horizontal stroke
        plusBezierPath.moveToPoint(CGPoint(
            x:bounds.width/2 - plusWidth/2,
            y:bounds.height/2))
        
        //add a point to the path at the end of the stroke
        plusBezierPath.addLineToPoint(CGPoint(
            x:bounds.width/2 + plusWidth/2,
            y:bounds.height/2 ))
        
        //move to the start of the vertical stroke
        plusBezierPath.moveToPoint(CGPoint(
            x:bounds.width/2,
            y:bounds.height/2 - plusWidth/2))
        
        //add the end point to the vertical stroke
        plusBezierPath.addLineToPoint(CGPoint(
            x:bounds.width/2 ,
            y:bounds.height/2 + plusWidth/2))
        return plusBezierPath.strokeImageWithColor(color, fillColor: nil)
        
        
    }
    
    static func changeNavBarToAppDefaultTheme(inout navBar navBar:UINavigationBar,inout titleView:UIView?){
        navBar.barTintColor = Utils.colorLightBlue
        navBar.translucent = false
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        if titleView != nil{
            titleView = UIImageView(image: UIImage(named: "navigationbar_logo"))
        }
    }
    
    //NSDictionary of variable binding 
    //http://stackoverflow.com/questions/24085140/nsdictionaryofvariablebindings-swift-equivalent/24592029
    static func dictionaryOfNames(arr:UIView...) -> Dictionary<String,UIView> {
        var d = Dictionary<String,UIView>()
        for (ix,v) in arr.enumerate() {
            d["v\(ix+1)"] = v
        }
        return d
    }
    
    static func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    
//    func addBorder(inout view view:UIView,edges: UIRectEdge, colour: UIColor = UIColor.whiteColor(), thickness: CGFloat = 1) -> [UIView] {
//        var borders = [UIView]()
//        
//        func border() -> UIView {
//            let border = UIView(frame: CGRectZero)
//            border.backgroundColor = colour
//            border.translatesAutoresizingMaskIntoConstraints = false
//            return border
//        }
//        
//        if edges.contains(.Top) || edges.contains(.All) {
//            let top = border()
//            view.addSubview(top)
//            view.addConstraints(
//                NSLayoutConstraint.constraintsWithVisualFormat("V:|-(0)-[top(==thickness)]",
//                    options: [],
//                    metrics: ["thickness": thickness],
//                    views: ["top": top]))
//            view.addConstraints(
//                NSLayoutConstraint.constraintsWithVisualFormat("H:|-(0)-[top]-(0)-|",
//                    options: [],
//                    metrics: nil,
//                    views: ["top": top]))
//            borders.append(top)
//        }
//        
//        if edges.contains(.Left) || edges.contains(.All) {
//            let left = border()
//            view.addSubview(left)
//            view.addConstraints(
//                NSLayoutConstraint.constraintsWithVisualFormat("H:|-(0)-[left(==thickness)]",
//                    options: [],
//                    metrics: ["thickness": thickness],
//                    views: ["left": left]))
//            view.addConstraints(
//                NSLayoutConstraint.constraintsWithVisualFormat("V:|-(0)-[left]-(0)-|",
//                    options: [],
//                    metrics: nil,
//                    views: ["left": left]))
//            borders.append(left)
//        }
//        
//        if edges.contains(.Right) || edges.contains(.All) {
//            let right = border()
//            view.addSubview(right)
//            view.addConstraints(
//                NSLayoutConstraint.constraintsWithVisualFormat("H:[right(==thickness)]-(0)-|",
//                    options: [],
//                    metrics: ["thickness": thickness],
//                    views: ["right": right]))
//            view.addConstraints(
//                NSLayoutConstraint.constraintsWithVisualFormat("V:|-(0)-[right]-(0)-|",
//                    options: [],
//                    metrics: nil,
//                    views: ["right": right]))
//            borders.append(right)
//        }
//        
//        if edges.contains(.Bottom) || edges.contains(.All) {
//            let bottom = border()
//            view.addSubview(bottom)
//            view.addConstraints(
//                NSLayoutConstraint.constraintsWithVisualFormat("V:[bottom(==thickness)]-(0)-|",
//                    options: [],
//                    metrics: ["thickness": thickness],
//                    views: ["bottom": bottom]))
//            view.addConstraints(
//                NSLayoutConstraint.constraintsWithVisualFormat("H:|-(0)-[bottom]-(0)-|",
//                    options: [],
//                    metrics: nil,
//                    views: ["bottom": bottom]))
//            borders.append(bottom)
//        }
//        
//        return borders
//    }
}