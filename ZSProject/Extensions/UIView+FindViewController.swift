//
//  UIView+FindViewController.swift
//  TipBitz
//
//  Created by Rafat Touqir Rafsun on 4/3/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit

/** FindViewController Extends UIView

*/
extension UIView {
    
    func findUIViewController() -> UIViewController? {
        
        
        
        
        
//        id nextResponder = [self nextResponder];
//        if ([nextResponder isKindOfClass:[UIViewController class]]) {
//            return nextResponder;
//        } else if ([nextResponder isKindOfClass:[UIView class]]) {
//            return [nextResponder traverseResponderChainForUIViewController];
//        } else {
//            return nil;
//        }
        
        return findForUIViewControllerIteratively()
        
    }
    
    
    func findForUIViewControllerIteratively() -> UIViewController?{
        if let nextResponder = self.nextResponder(){
            if nextResponder.isKindOfClass(UIViewController.self){
                return nextResponder as? UIViewController
            }else if nextResponder.isKindOfClass(UIView.self){
                return (nextResponder as? UIView)?.findForUIViewControllerIteratively()
            }else{
                return nil
            }
        }else{
            return nil
        }
    }

}
