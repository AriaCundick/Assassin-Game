//
//  LoginViewController.swift
//  Assassin Game
//
//  Created by Aria Cundick on 6/16/15.
//  Copyright (c) 2015 Code on the Cawb. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - IBOutlet vars
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - IBAction functions
    
    @IBAction func btnLogin_Clicked(sender: AnyObject) {
        
        //add code to validate credentials later
        
        //transition to main screen
        let VC = self.storyboard!.instantiateViewControllerWithIdentifier("Main") as! UINavigationController
        VC.modalTransitionStyle = .CrossDissolve
        self.presentViewController(VC, animated: true, completion: nil)
        //self.navigationController!.pushViewController(VC, animated: true)
        //self.navigationController!.performSegueWithIdentifier("Main", sender: sender)

    }
   

}
