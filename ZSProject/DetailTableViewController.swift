//
//  DetailTableViewController.swift
//  ZSProject
//
//  Created by Rafat Touqir Rafsun on 7/15/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit
import Kingfisher

class DetailTableViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let cellID = "teamCell"
    
    var responseJSON:JSON?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadDataInBackground()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    
    
    func loadDataInBackground() {
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        ConnectionHelper.instance.load(Urls.URL_TEAMS,params: ["squad":"0"],headers:["Authorization":"Token \(UserDefaultsHandler.load(Strings.UD_USER_TOKEN)!)"] , responseBlock: { (json:JSON?,errorStr:String?) in
            
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            if let json = json{
                
                //Login response
                
                guard let count = json["count"].int where count>0 else{
                    Helper.showToast(message: Strings.NO_SERVICE_FOUND)
                    return
                }
                
                
                self.responseJSON = json
                self.tableView.reloadData()
                
                
            }else{
                Helper.showToast(message: errorStr)
            }
            
            
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}



extension DetailTableViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.responseJSON?["results"]["resources"].array?.count ?? 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID) as! DetailTableViewCell
        
        let itemJSON = self.responseJSON?["results"]["resources"].array?[indexPath.row]
        
        
        if let ownerJSON = itemJSON?["owner"]{
            
            if let avaterURL = ownerJSON["avatar"].string{
                cell.imageViewAvater.kf_showIndicatorWhenLoading = true
                cell.imageViewAvater.kf_setImageWithURL(NSURL(string: avaterURL)!,
                                                        placeholderImage: nil,
                                                        optionsInfo: [.Transition(ImageTransition.Fade(1))])
            }
            
            cell.labelOwnerName.text = ownerJSON["username"].string
            cell.labelTeamName.text = ownerJSON["primary_team"].string
            
        }
        
        cell.labelLikes.text = itemJSON?["likes"].int?.toString ?? "0"
        
        if let time = itemJSON?["uploaded"].string{
        
        
        let split = time.characters.split{$0 == "T"}.map(String.init)
            //split only date,later time remaining can be shown from current date difference
            if let dateString = split.first{
                cell.labelTime.text = dateString
            }
        }
        //resource type check
        if let resourceType = itemJSON?["resource_type"].string{
            if resourceType == "video"{
                if let videoURL = itemJSON?["video"].string{
                    cell.imageViewPhoto_Video.kf_showIndicatorWhenLoading = true
                    cell.imageViewPhoto_Video.kf_setImageWithURL(NSURL(string: videoURL)!,
                                                            placeholderImage: nil,
                                                            optionsInfo: [.Transition(ImageTransition.Fade(1))])
                }
                
                
            }else{
                //for photo type
                if let photoURL = itemJSON?["photo"].string{
                    cell.imageViewPhoto_Video.kf_showIndicatorWhenLoading = true
                    cell.imageViewPhoto_Video.kf_setImageWithURL(NSURL(string: photoURL)!,
                                                                 placeholderImage: nil,
                                                                 optionsInfo: [.Transition(ImageTransition.Fade(1))])
                }
            }
            
            
        }
        
        
        
        if let caption = itemJSON?["caption"].string{
            cell.labelCaption.text = caption
        }
        
        
        return cell
    }
}