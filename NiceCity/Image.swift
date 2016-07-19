//
//  Image.swift
//  NiceCity
//
//  Created by Jihad Badran on 7/18/16.
//  Copyright © 2016 Jihad Badran. All rights reserved.
//

import UIKit

class Image: UIImageView {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }

}
