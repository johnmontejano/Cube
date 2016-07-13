    //
    //  registerViewController.swift
    //  chatappjohn
    //
    //  Created by John Montejano on 6/19/16.
    //  Copyright © 2016 John Montejano. All rights reserved.
    //

    import UIKit
    import ProgressHUD

    class RegisterViewController: UIViewController {

    @IBOutlet weak var emailEntry: UITextField!


    @IBOutlet weak var usernameEntry: UITextField!


    @IBOutlet weak var passwordEntry: UITextField!


    var backendless = Backendless.sharedInstance()

    var newUser: BackendlessUser?
    var email: String?
    var username: String?
    var password: String?
    var avatarImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        newUser = BackendlessUser()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    //MARK: Register button
    @IBAction func registerButton(sender: AnyObject) {
        if emailEntry.text != "" && usernameEntry.text != "" && passwordEntry.text != "" {
            ProgressHUD.show("Registering...😁")
            email = emailEntry.text
            username = usernameEntry.text
            password = passwordEntry.text
            
            
            register(self.email!, username: self.username!, password: self.password!, avatarImage: self.avatarImage)
            
        }else {
            //adverstising user to do an entry
        ProgressHUD.showError("All fields are Required😦")
        }
        
        
        
    }
    //MARK: Backendless user registration
    func register (email: String, username: String, password: String, avatarImage: UIImage?) {
        if avatarImage == nil {
            newUser!.setProperty("Avatar", object: "")
        }
        newUser!.email = email
        newUser!.name = username
        newUser!.password = password
        backendless.userService.registering(newUser, response: { (registeredUser : BackendlessUser!) -> Void in
            
            ProgressHUD.dismiss()
            //login new user
            self.loginUser(email, username: username, password: password)
            self.usernameEntry.text = ""
            self.passwordEntry.text = ""
            self.emailEntry.text = ""
        
        }) { (fault : Fault!) -> Void in
            print("server reported an issue, couldn't register\(fault)")
        }
    }
    func loginUser(email: String, username: String, password: String) {
        backendless.userService.login(email, password: password, response: { (user: BackendlessUser!) -> Void in
            //segue to recents viewController
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChatVC") as! UITabBarController
            vc.selectedIndex = 0
            self.presentViewController(vc, animated: true, completion: nil)
            
        }) { (fault: Fault!) -> Void in
            print("server reported an error: \(fault)")
        }
    }
    }
