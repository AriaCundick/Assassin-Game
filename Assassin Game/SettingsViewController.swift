//
//  SettingsViewController.swift
//  Assassin Game
//
//  Created by Aria Cundick on 6/11/15.
//  Copyright (c) 2015 Code on the Cawb. All rights reserved.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK - IBOutlet
    //pointer to the UIImgview in settings page
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var userName: UILabel!
    
    //MARK: - coredata var
    var players = [NSManagedObject]()    //NSManagedObject: Core Data datatype that is able to store,edit, delete, etc, so use an array in order to store multiple values
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK - IBAction
    
    //hook this action up in the first responder to the re-take photo button
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
        //create an alert box
        var alert = UIAlertController(title: "Change Name", message: "Enter a new name", preferredStyle: .Alert)
        //save text from the alert box to a variable
        let saveAction = UIAlertAction(title: "Change", style: .Default )
            { (action) -> Void in
                
                var text1 = alert.textFields![0] as! UITextField
                if text1.text == ""
                {
                    text1.text = self.userName.text!
                }
                self.userName.text = text1.text
                //self.savePlayerName(self.userName.text!)
                self.userName.reloadInputViews() //update the uiLabel
            }
        
        //cancel action button
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addTextFieldWithConfigurationHandler(nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
       
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    //MARK: - helper methods for core data
    
   /* func savePlayerName(name: String)
    {
        //retrieve manged object context in the app delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        //add an item to the manged item context
        let entity = NSEntityDescription.entityForName("Player", inManagedObjectContext: managedContext)
        let player =  NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        //set value for the attribute
        player.setValue(name, forKey: "name")
        
        //save the managed object context 
        var error: NSError?
        if !managedContext.save(&error) {
            println("could not save \(error), \(error?.userInfo)")
        }
        
        //clears the array until the most recent entry is the only thing left
        //for data efficieny purposes
        while (players.count > 0)
        {
            players.removeAtIndex(0)
        }
        players.append(player)
        
        //change the uilabel text
        userName.text = players[players.count-1].valueForKey("name") as! String?

    }
   
    func fetchData()
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = appDelegate.managedObjectContext!
        
        //fetch request into core data
        let fetchRequest = NSFetchRequest(entityName: "Player")
        
        //execute fetch request
        var error: NSError?
        
         if let fetchedResults = managedObjectContext.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject]
         {
            //if not nil
            players = fetchedResults
        }
         else {
            println("could not fetch data \(error), \(error?.userInfo)")
        }
        
        //initial start up data assignment
        //if(players[0].valueForKey("name") != nil){
            //userName.text = players[players.count-1].valueForKey("name") as! String?
        //}
        
    }*/

}
