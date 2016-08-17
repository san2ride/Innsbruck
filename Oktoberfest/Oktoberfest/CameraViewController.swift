//
//  CameraViewController.swift
//  Oktoberfest
//
//  Created by don't touch me on 8/16/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()

    var recieveImage: UIImage?
    var recievePhoto: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker.delegate = self
    
    }
    
    @IBAction func cameraButtonPushed(sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = .Camera
        } else {
            self.imagePicker.sourceType = .PhotoLibrary
        }
        
        self.imagePicker.allowsEditing = true
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            self.imageView.contentMode = .ScaleAspectFit
            self.imageView.image = pickedImage
            self.recievePhoto = pickedImage
        }
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func nextButtonPushed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("eCardSegue", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let controller = segue.destinationViewController as? eCardViewController {
            
            controller.thePhoto = self.recievePhoto
            controller.selectedBackGroundImage = self.recieveImage
        } else {
            print("incorrect segue")
        }
    }
    
}
