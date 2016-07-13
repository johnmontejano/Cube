//
//  ViewController.swift
//  chatappjohn
//
//  Created by John Montejano on 6/18/16.
//  Copyright © 2016 John Montejano. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
        override func viewDidLoad() {
        super.viewDidLoad()
        
        //back endless test (user test)
        let backendless = Backendless.sharedInstance()
        let user: BackendlessUser = BackendlessUser()
        user.email = "us4john@gmail.com"
        user.password = "apple1515"
        backendless.userService.registering(user)
        
        
    
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

