//
//  PostImgVC.swift
//  Under-The-Hood
//
//  Created by Brad Gray on 11/3/15.
//  Copyright © 2015 Brad Gray. All rights reserved.
//

import UIKit

class PostImgVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descField: UITextField!
    
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var addImage: UIButton!
    
     var photoPicker: UIImagePickerController!
    
      override func viewDidLoad() {
        super.viewDidLoad()
       
        photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        
        
        Image.layer.cornerRadius = Image.frame.size.width / 2
        Image.clipsToBounds = true
        
        
        
           }

    @IBAction func addImgTouched(sender: UIButton) {
    sender.setTitle("", forState: .Normal)
        presentViewController(photoPicker, animated: true, completion: nil)
    }
   
    @IBAction func makePostTouched(sender: UIButton) {
        if let title = titleField.text, let desc = descField.text, let img = Image.image {
            let imgPath = DataService.instance.saveAndCreateUrlPath(img)
            
            let post = Post(imagepath: imgPath, title: title, postDescription: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
            
        }
        
           }
   
    @IBAction func cancelTouched(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        photoPicker.dismissViewControllerAnimated(true, completion: nil)
        Image.image = image
    }
}
