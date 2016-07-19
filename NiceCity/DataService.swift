//
//  DataService.swift
//  NiceCity
//
//  Created by Jihad Badran on 7/18/16.
//  Copyright © 2016 Jihad Badran. All rights reserved.
//
import UIKit
import Foundation
class DataService{
    static let shared = DataService()
    
    let KEY_Posts = "Posts"
    private var _loadedPosts = [Post]()
    
    var loadedPosts:[Post]{
        return _loadedPosts
    }
    
    func savePosts(){
        let data = NSKeyedArchiver.archivedData(withRootObject: self._loadedPosts)
        UserDefaults.standard.set(data, forKey: KEY_Posts)
    }
    
    func loadPosts(){
        if let data = UserDefaults.standard.object(forKey: KEY_Posts) as? Data{
            if let Posts = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Post]{
                self._loadedPosts = Posts
            }
        }
        
    }
    
    func saveImageAndCreatePath(image:UIImage) -> String{
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(self._loadedPosts.count).png"
        let fullPath = documentsPathForFileName(name: imgPath)
        
        if let data = imgData{
            try! data.write(to: URL(fileURLWithPath: fullPath))
            print("image saved ... probably")
        }
        
        return imgPath
    }
    
    func getImage(forPath path:String) -> UIImage?{
        let filePath = documentsPathForFileName(name: path)
        let img = UIImage(named: filePath)
        return img
    }
    func documentsPathForFileName(name:String) -> String{
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullPath = path[0] as NSString
        
        return fullPath.appendingPathComponent(name)
    }
    
    func addPost(post:Post){
        self._loadedPosts.append(post)
        savePosts()
    }
    
    
}
