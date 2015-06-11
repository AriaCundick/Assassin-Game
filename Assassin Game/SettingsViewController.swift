//
//  SettingsViewController.swift
//  Assassin Game
//
//  Created by Aria Cundick on 6/11/15.
//  Copyright (c) 2015 Code on the Cawb. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //pointer to the UIImgview in settings page
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //hook up this action in the first responder to the re-take photo button
    //uses camera to take a new photo
    @IBAction func chooseImageFromCamera(){
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        imageView.image = (info[UIImagePickerControllerOriginalImage] as! UIImage)
        dismissViewControllerAnimated(true, completion: nil)
    }
   

}
