//
//  postCell.swift
//  Under-The-Hood
//
//  Created by Brad Gray on 11/3/15.
//  Copyright © 2015 Brad Gray. All rights reserved.
//

import UIKit

class postCell: UITableViewCell {
    
    @IBOutlet weak var postTitle: UILabel?
    @IBOutlet weak var postDesc: UILabel?
    @IBOutlet weak var postImg: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        postImg?.layer.cornerRadius = (postImg?.frame.width)! / 2
        postImg?.clipsToBounds = true
    
    }
    func configureCell(post: Post) {
        postTitle?.text = post.title
        postDesc?.text = post.postDescription
        postImg?.image = DataService.instance.retrieveImageForpath(post.imagePath)
       
    }
   
}
