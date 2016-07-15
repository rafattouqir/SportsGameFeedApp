//
//  UIButton+CenterTextImageWithInsetRightOrLeft.swift
//  Tipbitz
//
//  Created by Rafat Touqir Rafsun on 3/10/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit

/** CenterTextImageWithInsetRightOrLeft Extends UIButton

*/
extension UIButton {
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
}
