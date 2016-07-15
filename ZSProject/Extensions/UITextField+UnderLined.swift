
//
//  UITextField+UnderLined.swift
//  TipBitz
//
//  Created by Rafat Touqir Rafsun on 4/7/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit

/** UnderLined Extends UITextField

*/
extension UITextField {
    
    func underlined(withColor color:UIColor?){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = color?.CGColor ?? UIColor.blackColor().CGColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
