//
//  Helper.swift
//  Tipbitz
//
//  Created by Rafat Touqir Rafsun on 2/28/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit
import Alamofire
import CoreTelephony
//import GoogleMaps

struct Helper {
    
    
    static let versionNumber = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
    static let buildNumber = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleVersion") as! String
//    static var imageView:FLAnimatedImageView?
    static var blurredViewShowsProgress:UIView?
    
    static func jsonStringWithJSONObject(jsonObject: AnyObject) throws -> String? {
        let data: NSData? = try? NSJSONSerialization.dataWithJSONObject(jsonObject, options: NSJSONWritingOptions.PrettyPrinted)
        
        var jsonStr: String?
        if data != nil {
            jsonStr = String(data: data!, encoding: NSUTF8StringEncoding)
        }
        
        return jsonStr
    }
    
    static func showAlert(title:String?, message:String?,viewController:UIViewController?) {
        if #available(iOS 8.0, *) {
            let alert = UIAlertController(title: title,
                                          message: message, preferredStyle: .Alert)
            let dismissAction = UIAlertAction(title: "Dismiss", style: .Destructive, handler: nil)
            alert.addAction(dismissAction)
            viewController?.presentViewController(alert, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
            let alert = UIAlertView.init(title: title, message: message, delegate: nil,
                                         cancelButtonTitle: "Dismiss")
            alert.show()
        }
    }
    
    static func showToast(message msg:String?){
        if let message = msg{
            MDToast(text: message, duration: kMDToastDurationShort).show()
        }
    }
    
    static func random(digit digit:Int) -> Int{
        // Start with the digits
        let digits = 1...9
        
        // Shuffle them
        let shuffledDigits = digits.shuffle()
        
        // Take the number of digits you would like
        let fourDigits = shuffledDigits.prefix(digit)
        
        // Add them up with place values
        let value = fourDigits.reduce(0) {
            $0*10 + $1
        }
        
        return value
    }
    
    static func countryCodePhone() -> String?{
        
        var phoneCountryCode:String? //like +880
        
        let netInfo = CTTelephonyNetworkInfo()
        let carrier = netInfo.subscriberCellularProvider
        if let mobileCountryCode = carrier?.mobileCountryCode{
            //will work if you've sim in ios device
            phoneCountryCode = mobileCountryCode
        }else if let countryNetworkCode = carrier?.mobileNetworkCode{
            phoneCountryCode = countryNetworkCode
        }
        
        
        
        let currentLocale = NSLocale.currentLocale()
        
        //let currentLocale = NSLocale(localeIdentifier: "en_BD")
        let countryCode1 = currentLocale.objectForKey(NSLocaleCountryCode) as? String // "BD"
        
        
        return phoneCountryCode
    }
    
//    //MARK: Open MainView
//    static func openMainView(withMsg:String?) {
//        
//        //Segue to next MainViewController
//        
//        if var rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController{
//            let nextViewNavController = rootViewController.storyboard?.instantiateViewControllerWithIdentifier("SWRevealViewController") as! SWRevealViewController
//            
//            if let withMsg = withMsg{
//                nextViewNavController.view.makeToast(message: withMsg)
//            }
//            
//            rootViewController = nextViewNavController
//        }
//        
//    }
//    //MARK: Open MainView
//    static func openMyTripViewController(tripType:TripType) {
//        
//        //Segue to next MainViewController
//        
//        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController{
//            let myTripViewController = rootViewController.storyboard?.instantiateViewControllerWithIdentifier("MyTripViewController") as! MyTripViewController
//            let navigationController = UINavigationController(rootViewController: myTripViewController)
//            
//            
//            
//                rootViewController.presentViewController(navigationController, animated: true, completion: {
//                    myTripViewController.moveToViewControllerAtIndex(tripType.hashValue, animated: true)
//                })
//            
//            
//        }
//        
//    }
    
    
    //    static let imageCache = AutoPurgingImageCache()
    
//    static func showToast(msg:String){
//        let crToastOptions:[NSObject:AnyObject] = [
//            kCRToastTextKey : msg,
//            //                    kCRToastSubtitleTextKey : "Suggestion",
//            kCRToastTextAlignmentKey : NSTextAlignment.Center.rawValue,
//            kCRToastBackgroundColorKey : Colors.colorLightOrange!,
//            kCRToastAnimationInTypeKey : CRToastAnimationType.Gravity.rawValue,
//            kCRToastNotificationTypeKey : CRToastType.NavigationBar.rawValue,
//            kCRToastAnimationOutTypeKey : CRToastAnimationType.Gravity.rawValue,
//            kCRToastAnimationInDirectionKey : CRToastAnimationDirection.Top.rawValue,
//            kCRToastAnimationOutDirectionKey : CRToastAnimationDirection.Top.rawValue
//        ]
//        CRToastManager.showNotificationWithOptions(crToastOptions, completionBlock: {
//            
//        })
//    }
//    
//    
//    static func showGif(inout viewToFitIn:UIView){
//        //Show gif
//        imageView = FLAnimatedImageView()
//        blurredViewShowsProgress = UIView(frame: viewToFitIn.bounds)
//        
//        Helper.addGifLoader("PetsofAsia_Fast", toView: &viewToFitIn, gifImageView: &imageView!, loaderContainerView: &blurredViewShowsProgress!)
//    }
//    
//    static func hideGif(){
//        imageView?.stopAnimating()
//        Helper.removeGifLoader(&imageView!, loaderContainerView: &blurredViewShowsProgress!)
//        
//    }
//    
//    
//    
//    
//    
//    static func addGifLoader(gifName:String,inout toView view:UIView,inout gifImageView imageView:FLAnimatedImageView,inout loaderContainerView blurredViewShowsProgress:UIView) {
//        //        //SwiftGif extension lib
//        //        let loaderGif = UIImage.gifWithName("loader")
//        //        let imageView = UIImageView(image: loaderGif)
//        
//        let imageURL = NSBundle.mainBundle().URLForResource(gifName, withExtension: "gif")
//        let image = FLAnimatedImage.init(animatedGIFData: NSData.init(contentsOfURL: imageURL!))
//        imageView.animatedImage = image
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .ScaleAspectFit
//        
//        
//        //        //light blue color transparency factor
//        blurredViewShowsProgress.backgroundColor = UIColor(white: 1, alpha: 0.7)
//        
//        let constraintCenterX = NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0)
//        let constraintCenterY = NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)
//        let constraintEqualX = NSLayoutConstraint(item: imageView, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1 - Utils.gifLoaderSizeFactor/10, constant: 0) // 1 - gifLoaderSizeFactor/10 = 0.2
//        let constraintEqualY = NSLayoutConstraint(item: imageView, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1 - Utils.gifLoaderSizeFactor/10, constant: 0)
//        
//        
//        view.addSubview(blurredViewShowsProgress)
//        view.addSubview(imageView)
//        view.addConstraints([constraintCenterX,constraintCenterY,constraintEqualX,constraintEqualY])
//        
//        
//    }
//    
//    static func removeGifLoader(inout gifImageView:FLAnimatedImageView,inout loaderContainerView:UIView) {
//        gifImageView.removeFromSuperview()
//        loaderContainerView.removeFromSuperview()
//    }
//    
//    
//    static func geocodeAddress(address: String?, withCompletionHandler completionHandler: ((status: String, success: Bool , geoLatLong:CLLocationCoordinate2D?,address:String?) -> Void)) {
//    
//            let baseURLGeocode = "https://maps.googleapis.com/maps/api/geocode/json?"
//    
//            var lookupAddressResults: Dictionary<NSObject, AnyObject>!
//    
//        
//    
//            
//            if let lookupAddress = address ?? Optional("Singapore") {
//                var geocodeURLString = baseURLGeocode + "address=" + lookupAddress
//                geocodeURLString = geocodeURLString.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())!
//    
//                let geocodeURL = NSURL(string: geocodeURLString)
//    
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    let geocodingResultsData = NSData(contentsOfURL: geocodeURL!)
//    
//                    do{
//                        
//                        let dictionary = try NSJSONSerialization.JSONObjectWithData(geocodingResultsData!, options: [])
//                        
//                        
//                            // Get the response status.
//                            let status = dictionary["status"] as! String
//                            
//                            if status == "OK" {
//                                let allResults = dictionary["results"] as! Array<Dictionary<NSObject, AnyObject>>
//                                lookupAddressResults = allResults[0]
//                                
//                                // Keep the most important values.
//                                let fetchedFormattedAddress = lookupAddressResults["formatted_address"] as! String
//                                let geometry = lookupAddressResults["geometry"] as! Dictionary<NSObject, AnyObject>
//                                let fetchedAddressLongitude = ((geometry["location"] as! Dictionary<NSObject, AnyObject>)["lng"] as! NSNumber).doubleValue
//                                let fetchedAddressLatitude = ((geometry["location"] as! Dictionary<NSObject, AnyObject>)["lat"] as! NSNumber).doubleValue
//                                let coordinate = CLLocationCoordinate2D(latitude: fetchedAddressLatitude, longitude: fetchedAddressLongitude)
//                                completionHandler(status: status, success: true ,geoLatLong: coordinate,address: fetchedFormattedAddress)
//                            }
//                            else {
//                                completionHandler(status: status, success: false ,geoLatLong: nil , address: nil)
//                            }
//                        
//                        
//                    }catch let error as NSError{
//                        print(error)
//                        completionHandler(status: "", success: false ,geoLatLong: nil , address: nil)
//                    }
//                    
//                    
//                })
//            }
//            else {
//                completionHandler(status: "No valid address.", success: false ,geoLatLong: nil , address: nil)
//            }
//        }
//    
    
    
}
