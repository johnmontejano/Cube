//
//  Recent.swift
//  chatappjohn
//
//  Created by John Montejano on 7/10/16.
//  Copyright © 2016 John Montejano. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

let firebase = FIRDatabase.database().reference()
let backendless = Backendless.sharedInstance()
let currentUser = backendless.userService.currentUser
//MARK: Helper functions



private let dateFormat = "yyyyMMddHHmmss"
func dateFormatter() -> NSDateFormatter{
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = dateFormat
    
    return dateFormatter 
}