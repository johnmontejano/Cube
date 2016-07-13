//
//  RecentViewController.swift
//  chatappjohn
//
//  Created by John Montejano on 7/10/16.
//  Copyright © 2016 John Montejano. All rights reserved.
//

import UIKit

class RecentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ChooseUserDelegate {

   
    
    var recents: [NSDictionary] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recents.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RecentTableViewCell
        let recent = recents[indexPath.row]
        cell.bindData(recent)
        return cell
    }
    //MARK:  UITableViewDelegte functions
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("recentsToChatSeg", sender: indexPath)
    }
//MARK: IBactions
    
    @IBAction func startNewChatBarButtonItemPressed(sender: AnyObject) {
        performSegueWithIdentifier("recentToChooseUserVC", sender: self)
        
    }
    //MARK: Navigatgion
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "recentToChooseVC"{
            
            let vc = segue.destinationViewController as! ChooseUserViewController
            vc.delegate = self
            
        }
        if segue.identifier == "recentsToChatSeg" {
            let indexPath = sender as! NSIndexPath
            let chatVC = segue.destinationViewController as!ChatViewController
            let recent = recents[indexPath.row]
            //set chatVC rencent to our recent
            
        }
    
    }
    //MARK: chooseuserdelegate
    
 func createChatRoom(withUser: BackendlessUser) {
    let chatVC = ChatViewController()
        chatVC.hidesBottomBarWhenPushed = true
        
    navigationController?.pushViewController(chatVC, animated: true)
        //set chatVC rencent to our recent

        
    }
    
}






