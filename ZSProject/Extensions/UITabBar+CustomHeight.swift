//
//  UITabBar+CustomHeight.swift
//  PetsOfAsia
//
//  Created by Rafat Touqir Rafsun on 4/10/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit

/** CustomHeight Extends UITabBar

*/
extension UITabBar {
    
    override public func sizeThatFits(size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        
//        if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Compact) {
//           
//            sizeThatFits.height = 55
//            
//        }else{
//            
//            sizeThatFits.height = 70
        //        }
        sizeThatFits.height = 60
        return sizeThatFits
    }
}
