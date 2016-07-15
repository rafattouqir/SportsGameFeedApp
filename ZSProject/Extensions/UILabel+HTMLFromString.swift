//
//  UILabel+HTMLFromString.swift
//  TipBitz
//
//  Created by Rafat Touqir Rafsun on 4/19/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit

/** HTMLFromString Extends UILabel

*/
extension UILabel {
    func setHTMLFromString(text: String) {
        let modifiedFont = NSString(format:"<span style=\"font-family: \(self.font!.fontName); font-size: \(self.font!.pointSize)\">%@</span>", text) as String
        
        let attrStr = try! NSAttributedString(
            data: modifiedFont.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
            options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding],
            documentAttributes: nil)
        
        self.attributedText = attrStr
    }
}
