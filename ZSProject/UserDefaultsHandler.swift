//
//  UserDefaultsHandler.swift
//  TipBitz
//
//  Created by Rafat Touqir Rafsun on 3/15/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit



class UserDefaultsHandler{
    
    static func save(key:String, value:String) {
        print("\(key) for \(value)")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(NSKeyedArchiver.archivedDataWithRootObject(value), forKey: key)
    }
    static func save( key : String,  value:Int) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(NSKeyedArchiver.archivedDataWithRootObject(value), forKey: key)
    }
    static func save( key : String,  value:Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(NSKeyedArchiver.archivedDataWithRootObject(value), forKey: key)
    }
    
    
    static func load( key : String) -> String? {
        
        if let userData =  NSUserDefaults.standardUserDefaults().objectForKey(key) as? NSData,string = NSKeyedUnarchiver.unarchiveObjectWithData(userData) as? String{
            return string
        }else{
            return nil
        }
        
    }
    static func loadInteger( key : String) -> Int? {
        
        if let userData =  NSUserDefaults.standardUserDefaults().objectForKey(key) as? NSData,string = NSKeyedUnarchiver.unarchiveObjectWithData(userData) as? Int{
            return string
        }else{
            return nil
        }
        
    }
    static func loadBoolean( key : String) -> Bool? {
        
        if let userData =  NSUserDefaults.standardUserDefaults().objectForKey(key) as? NSData,string = NSKeyedUnarchiver.unarchiveObjectWithData(userData) as? Bool{
            return string
        }else{
            return nil
        }
        
    }
    
    
    
    static func loadNotificationStatus(key:String) -> Bool {
        if let userData =  NSUserDefaults.standardUserDefaults().objectForKey(key) as? NSData,string = NSKeyedUnarchiver.unarchiveObjectWithData(userData) as? Bool{
            return string
        }else{
            return false
        }
    }
    
    static func remove(key:String){
        NSUserDefaults.standardUserDefaults().removeObjectForKey(key)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    static func synchronize(){
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
}