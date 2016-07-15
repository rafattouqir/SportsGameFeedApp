//
//  LabelWithInsets.swift
//  Boatlah
//
//  Created by Rafat Touqir Rafsun on 5/22/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit

class LabelWithInsets: UILabel {

    let insetSize:CGFloat = 5
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func drawTextInRect(rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 0, left: insetSize, bottom: 0, right: insetSize)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }

}
