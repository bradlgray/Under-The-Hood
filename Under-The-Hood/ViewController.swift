//
//  ViewController.swift
//  Under-The-Hood
//
//  Created by Brad Gray on 10/30/15.
//  Copyright © 2015 Brad Gray. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var posts = [Post]()
    
    var fakeCell1 = Post(imagepath: "", title: "unimportant words", postDescription: "Hey you wanna see a magic trick, really it will be really cool")
    var fakeCell2 = Post(imagepath: "", title: "Bane", postDescription: "Now I must break you. man I got huge traps, definatley using steroids")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        posts.append(fakeCell1)
        posts.append(fakeCell2)
        
        tableView.reloadData()
        
        
       
          }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("postCell") as? postCell {
            cell.configureCell(post)
            return cell
        } else {
            let cell = postCell()
            cell.configureCell(post)
            return cell
        }
    }
       func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 87.0
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
}

