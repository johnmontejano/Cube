//
//  loginViewController.swift
//  chatappjohn
//
//  Created by John Montejano on 6/19/16.
//  Copyright © 2016 John Montejano. All rights reserved.
//

import UIKit
import ProgressHUD

class loginViewController: UIViewController {
   
   
    @IBOutlet weak var emailLoginEntry: UITextField!
    
    @IBOutlet weak var passwordLoginEntry: UITextField!
    
    let backendless = Backendless.sharedInstance()
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginButtonSucces(sender: AnyObject) {
        if emailLoginEntry.text !=  "" && passwordLoginEntry.text != "" {
            
            
            self.email = emailLoginEntry.text
            self.password = passwordLoginEntry.text
            //log in user 
            loginUser(email!, password: password!)
            
            
        } else {
            //show an error to user
            ProgressHUD.showError("All fields are Required😦")

        }
        
        
        
    }

    
    func loginUser(email:String, password:String){
        
        
        backendless.userService.login(email, password: password, response: { (user : BackendlessUser!)  -> Void in
            self.emailLoginEntry.text = ""
            self.passwordLoginEntry.text = ""
            
            //segue to recents view
            print("logged in")
           
            
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChatVC") as! UITabBarController
            vc.selectedIndex = 0
            self.presentViewController(vc, animated: true, completion: nil)

            
            
        }) { (fault : Fault!) in
                print("couldn't log in user \(fault)")
        }
    }

}
