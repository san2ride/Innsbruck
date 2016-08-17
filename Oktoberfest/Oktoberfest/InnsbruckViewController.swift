//
//  InnsbruckViewController.swift
//  Oktoberfest
//
//  Created by don't touch me on 8/16/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class InnsbruckViewController: UIViewController {
    
    var selectedBackGroundImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func firstButtonPushed(sender: UIButton) {
        
        self.selectedBackGroundImage = UIImage(named: "inn5")
        self.performSegueWithIdentifier("CameraSegue", sender: nil)
    }
    
    @IBAction func secondButtonPushed(sender: UIButton) {
        
        self.selectedBackGroundImage = UIImage(named: "inn3")
        self.performSegueWithIdentifier("CameraSegue", sender: nil)
    }
    
    @IBAction func thirdButtonPushed(sender: UIButton) {
        
        self.selectedBackGroundImage = UIImage(named: "inn4")
        self.performSegueWithIdentifier("CameraSegue", sender: nil)
    }
    
    @IBAction func fourthButtonPushed(sender: UIButton) {
        
        self.selectedBackGroundImage = UIImage(named: "inn2")
        self.performSegueWithIdentifier("CameraSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController as? CameraViewController
        
        controller?.recieveImage = self.selectedBackGroundImage
        
    }
    
}
