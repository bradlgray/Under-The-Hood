//
//  Post.swift
//  Under-The-Hood
//
//  Created by Brad Gray on 11/3/15.
//  Copyright © 2015 Brad Gray. All rights reserved.
//

import Foundation
import UIKit

class Post {
    
    private var _imagePath: String
    private var _title: String
    private var _postDescription: String
    
    
    var imagePath: String {
        return _imagePath
    }
    var title: String {
        return  _title
    }
    var postDescription: String {
        return _postDescription
    }
    
    init(imagepath: String, title: String, postDescription: String) {
        self._imagePath = imagepath
        self._title = title
        self._postDescription = postDescription
    }
    
    
    
    
}
