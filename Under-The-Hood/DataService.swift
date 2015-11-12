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
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadPosts() {
        if let postData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POST) as? NSData {
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postData) as? [Post] {
                _loadedPosts = postsArray
            }
        }
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postLoaded", object: nil))
    }
    
    func saveAndCreateUrlPath(image: UIImage) -> String {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFile(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    func retrieveImageForpath(path: String) -> UIImage? {
        let fullPath = documentsPathForFile(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPost(post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
        
    }
    func documentsPathForFile(name: String) -> String {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = path[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
        
    }
}
