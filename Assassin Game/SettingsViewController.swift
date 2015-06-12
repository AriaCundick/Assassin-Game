//
//  SettingsViewController.swift
//  Assassin Game
//
//  Created by Aria Cundick on 6/11/15.
//  Copyright (c) 2015 Code on the Cawb. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK - IBOutlet
    //pointer to the UIImgview in settings page
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK - IBAction
    
    //hook up this action in the first responder to the re-take photo button
    //uses camera to take a new photo
    @IBAction func chooseImageFromCamera(){
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    //save image to uiimage
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        imageView.image = (info[UIImagePickerControllerOriginalImage] as! UIImage)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func changeNameButton(sender: AnyObject) {
        //pop up box
        var alert = UIAlertController(title: "Change Name", message: "Enter a new name", preferredStyle: .Alert)
        //save button
        let saveAction = UIAlertAction(title: "Change", style: .Default )
            { (action) -> Void in
                
                var text1 = alert.textFields![0] as! UITextField
                if text1.text == "" 
                {
                    text1.text = self.userName.text!
                }
                
                self.userName.text = text1.text
                self.userName.reloadInputViews()
            }
        
        //cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addTextFieldWithConfigurationHandler(nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
       
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
   

}
