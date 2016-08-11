//
//  BeginViewController.swift
//  chatappjohn
//
//  Created by John Montejano on 6/19/16.
//  Copyright © 2016 John Montejano. All rights reserved.
//

import UIKit

class BeginViewController: UIViewController {
    let backendless = Backendless.sharedInstance()
    var currentUser: BackendlessUser?
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        backendless.userService.setStayLoggedIn(true)
        currentUser = backendless.userService.currentUser
        
        if currentUser != nil {
            
//            dispatch_async(dispatch_get_main_queue()) {
//            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChatVC") as! UITabBarController
//            vc.selectedIndex = 0
//            self.presentViewController(vc, animated: true, completion: nil)
//        }
            
    }
}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
