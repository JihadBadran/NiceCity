//
//  BTN.swift
//  NiceCity
//
//  Created by Jihad Badran on 7/18/16.
//  Copyright © 2016 Jihad Badran. All rights reserved.
//

import UIKit

class BTN: UIButton {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.backgroundColor = #colorLiteral(red: 1, green: 0.2713843944, blue: 0.1150697397, alpha: 1)
        self.setTitleColor(UIColor.white(), for: .normal)
    }

}
