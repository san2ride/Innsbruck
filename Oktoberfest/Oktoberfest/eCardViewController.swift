//
//  eCardViewController.swift
//  Oktoberfest
//
//  Created by don't touch me on 8/16/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.


import UIKit
import AVFoundation

class eCardViewController: UIViewController {
    
    @IBOutlet weak var selfieImage: UIImageView!
    @IBOutlet var backGroundImage: UIImageView!
    @IBOutlet weak var iconAnimationImage: UIImageView!
    
    var thePhoto: UIImage?
    var selectedBackGroundImage: UIImage?
    var backGroundPlayer: AVAudioPlayer?
    var timer: NSTimer?
    var imagesArray = [UIImage]()

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let theImage = self.thePhoto {
            self.selfieImage.image = theImage
        }
        
        if let theImage = self.selectedBackGroundImage {
            self.backGroundImage.image = theImage
        }
        
        self.backGroundPlayer = self.getAudioPlayer("Polka-Franzi", fileExt: "m4a")
        self.backGroundPlayer?.play()
        
        for i in 1...3 {
            if let image = UIImage(named: "\(i)of") {
                imagesArray.append(image)
                print("of_\(i)")
            }
        }
        
        iconAnimationImage.animationImages = imagesArray
        iconAnimationImage.animationDuration = 1.1
        iconAnimationImage.animationRepeatCount = 0
        iconAnimationImage.startAnimating()
        
    }
    
    func getAudioPlayer(filename: String, fileExt: String) -> AVAudioPlayer? {
        var audioPlayer: AVAudioPlayer?
        
        if let filePath = NSBundle.mainBundle().URLForResource(filename, withExtension: fileExt) {
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: filePath)
                
                audioPlayer?.volume = 1.0
                audioPlayer?.prepareToPlay()
                
            } catch {
                print("an error occured")
            }
            
        } else {
            print("I cant find the file")
        }
        return audioPlayer
    }

}
