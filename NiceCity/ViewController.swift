//
//  ViewController.swift
//  NiceCity
//
//  Created by Jihad Badran on 7/17/16.
//  Copyright © 2016 Jihad Badran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView:UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.shared.loadPosts()
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    func onPostsLoaded(notif:AnyObject){
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = DataService.shared.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as? PostCell{
            cell.configureCell(post: post)
            return cell
        }else{
            let cellnew = PostCell()
            cellnew.configureCell(post: post)
            return cellnew
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.shared.loadedPosts.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailsView", sender: DataService.shared.loadedPosts[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if let details = segue.destinationViewController as? detailsViewController{
            if let post = sender as? Post{
                details.postTitle = post.title
                details.Desk = post.postDesk
                details.imagePath = post.imagePath
            }else{
                details.mainImage.image = UIImage(named:"not-found")
            }
        }
        
    }
    
    


}

