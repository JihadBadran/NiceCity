//
//  addPostVC.swift
//  NiceCity
//
//  Created by Jihad Badran on 7/18/16.
//  Copyright © 2016 Jihad Badran. All rights reserved.
//

import UIKit

class addPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var imageView:Image!
    @IBOutlet weak var postTitle:UITextField!
    @IBOutlet weak var postDesk:UITextField!
    @IBOutlet weak var addImageBtn:UIButton!
    
    
    var imagePicker:UIImagePickerController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        
    }
    @IBAction func postBtnClicked(sender:UIButton!){
        if let posttitle = postTitle.text, let postdesk = postDesk.text, let image = imageView.image{
            
            let imagePath = DataService.shared.saveImageAndCreatePath(image: image)
            
            let post = Post(imagePath: imagePath, title: posttitle, postDesk: postdesk)
            DataService.shared.addPost(post: post)
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func addImage(sender:AnyObject){
        addImageBtn.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    @IBAction func cancellBtnClicked(sender:AnyObject){
        dismiss(animated: true, completion: nil)
    }
    

    

}
