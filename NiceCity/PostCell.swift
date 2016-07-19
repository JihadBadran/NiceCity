//
//  PostCell.swift
//  NiceCity
//
//  Created by Jihad Badran on 7/17/16.
//  Copyright © 2016 Jihad Badran. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var mainImage:Image!
    @IBOutlet weak var mainTitle:UILabel!
    @IBOutlet weak var postDesk:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    func configureCell(post:Post){
        mainTitle.text = post.title
        mainImage.image = DataService.shared.getImage(forPath: post.imagePath)
        postDesk.text = post.postDesk
    }
    

}
