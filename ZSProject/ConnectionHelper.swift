//
//  ConnectionHelper.swift
//  UDOY
//
//  Created by Rafsun@BScheme on 7/13/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit
import Alamofire

struct ConnectionHelper {
    
    static let instance = ConnectionHelper()
    
    
    private var alamoFireManager:Alamofire.Manager?
    
    private init(){
        setAFConfig()
    }
    
    
    
    func load(url:String,params:[String: AnyObject]? = nil,headers:[String: String]? = nil,responseBlock:(json:JSON?,errorStr:String?) -> () ) {
        
        guard Utils.isConnectedToNetwork() else{
            MDToast(text: Strings.NO_INTERNET, duration: kMDToastDurationShort).show()
            return
        }
        
        cancelAllRequests()
        
        
        
        var afMethod = Alamofire.Method.GET
        var afParameters = params
        var afEncoding = Alamofire.ParameterEncoding.URL
        var afHeader:[String:String]? = headers
        switch url {
        case Urls.URL_LOGIN:
            afMethod = .POST
//            afEncoding = .JSON
//            afParameters = ["phone":"01913338081","gcm_id":"sdfoijsdofjdsof"]
        case Urls.URL_TEAMS:
            afMethod = .GET
            
        
        default:
            break
        }
        
        Alamofire.request(afMethod, url, parameters: afParameters,encoding: afEncoding,headers: afHeader)
            
            
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let jso = response.result.value {
                    
                    let json = JSON(jso)
                    
                    
                    responseBlock(json: json,errorStr: nil)
                    
                }else if let error = response.result.error?.localizedDescription{
                    responseBlock(json: nil,errorStr: error)
                }else{
                    responseBlock(json: nil,errorStr: Strings.FETCH_ERROR)
                }
                
        }
        
        
        
        
        
        
    }
    
    
    
    mutating private func setAFConfig(){
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForResource = 4
        configuration.timeoutIntervalForRequest = 4
        alamoFireManager = Alamofire.Manager(configuration: configuration)
    }
    func cancelAllRequests() {
        print("cancelling ConnectionHelper requests")
        
        if #available(iOS 9, *){
            alamoFireManager?.session.getAllTasksWithCompletionHandler { (tasks) -> Void in
                tasks.forEach({ $0.cancel() })
            }
        } else {
            // Fallback on earlier versions
            alamoFireManager?.session.getTasksWithCompletionHandler({
                $0.0.forEach({ $0.cancel() })
                $0.1.forEach({ $0.cancel() })
                $0.2.forEach({ $0.cancel() })
            })
        }
        
        
    }
    

}


