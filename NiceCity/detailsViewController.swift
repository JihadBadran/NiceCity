//
//  detailsViewController.swift
//  NiceCity
//
//  Created by Jihad Badran on 7/17/16.
//  Copyright © 2016 Jihad Badran. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {
    
    @IBOutlet weak var mainImage:Image!
    @IBOutlet weak var mainTitle:UILabel!
    @IBOutlet weak var postDesk:UILabel!
    
    var imagePath:String!
    var postTitle:String!
    var Desk:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        mainTitle.text = postTitle
        postDesk.text = Desk
        if imagePath != ""{
            mainImage.image = DataService.shared.getImage(forPath: imagePath)
        }
    }
    
    
    
    @IBAction func cancel(sender:AnyObject){
        dismiss(animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
