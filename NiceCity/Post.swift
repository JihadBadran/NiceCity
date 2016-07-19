//
//  Post.swift
//  NiceCity
//
//  Created by Jihad Badran on 7/17/16.
//  Copyright © 2016 Jihad Badran. All rights reserved.
//

import Foundation
class Post:NSObject, NSCoding {
    private var _imagePath:String!
    private var _title:String!
    private var _postDesk:String!
    
    var imagePath:String{
        return _imagePath
    }
    var title:String{
        return _title
    }
    var postDesk:String{
        return _postDesk
    }
    
    override init(){
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        if let imagepath = aDecoder.decodeObject(forKey: "imagePath") as? String{
            self._imagePath = imagepath
        }
        if let postTitle = aDecoder.decodeObject(forKey: "title") as? String{
            self._title = postTitle
        }
        if let postdesk = aDecoder.decodeObject(forKey: "postDesk") as? String{
            self._postDesk = postdesk
        }
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._postDesk, forKey: "postDesk")
        aCoder.encode(self._title, forKey: "title")
        aCoder.encode(self._imagePath, forKey: "imagePath")
    }
    
    init(imagePath:String,title:String,postDesk:String) {
        self._imagePath = imagePath
        self._title = title
        self._postDesk = postDesk
    }
    
    
    
}
