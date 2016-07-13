//
//  ChooseUserViewController.swift
//  chatappjohn
//
//  Created by John Montejano on 7/10/16.
//  Copyright © 2016 John Montejano. All rights reserved.
//

import UIKit

protocol ChooseUserDelegate {
    func createChatRoom(withUser: BackendlessUser)
    
}
class ChooseUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var delegate: ChooseUserDelegate?
    
    var users: [BackendlessUser] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK: IBAActions
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    //MARK: UITableviewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        
        return cell
        
    }
    //MARK: UITableViewDelagate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let user = users[indexPath.row]
        
        delegate?.createChatRoom(user)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
        //MARK: Load backendless users
    
    func loadUsers() {
        
        let whereClause = "objectId != '\(currentUser.objectId)'"
        let dataQuery = BackendlessDataQuery()
        dataQuery.whereClause = whereClause
        
        let dataStore = backendless.persistenceService.of(BackendlessUser.ofClass())
        dataStore.find(dataQuery, response: {(users: BackendlessCollection!)-> Void in
            
            self.users = users.data as! [BackendlessUser]
            self.tableView.reloadData()
            
        }) {(fault : Fault!) -> Void in
            print ("Error, couldn't retrieve users: \(fault)")
        }
    }
}





