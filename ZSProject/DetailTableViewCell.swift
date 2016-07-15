//
//  DetailTableViewCell.swift
//  ZSProject
//
//  Created by Rafat Touqir Rafsun on 7/15/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageViewAvater: UIImageView!
    
    @IBOutlet weak var labelOwnerName: UILabel!
    
    @IBOutlet weak var labelTeamName: UILabel!
    
    
    
    @IBOutlet weak var labelTime: UILabel!
    
    @IBOutlet weak var labelLikes: UILabel!
    
    
    @IBOutlet weak var imageViewPhoto_Video: UIImageView!
    
    
    @IBOutlet weak var labelCaption: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
