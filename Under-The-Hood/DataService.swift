//
//  DataService.swift
//  Under-The-Hood
//
//  Created by Brad Gray on 11/5/15.
//  Copyright © 2015 Brad Gray. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static let instance = DataService()
    let KEY_POST = "post"
 
    private var _loadedPosts = [Post]()
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }
    
    func savePosts() {
        let postData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postData, forKey: KEY_POST)
    }
    
    func loadPosts() {
        if let postData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POST) as? NSData {
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postData) as? [Post] {
                _loadedPosts = postsArray
            }
        }
    }
    
    func saveAndCreateUrlPath(image: UIImage) {
        
    }
    
    func retrieveImageForpath(path: String) {
        
    }
    
    func addPost(post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
}
