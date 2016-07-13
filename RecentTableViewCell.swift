    //
    //  RecentTableViewCell.swift
    //  chatappjohn
    //
    //  Created by John Montejano on 7/10/16.
    //  Copyright © 2016 John Montejano. All rights reserved.
    //

    import UIKit

    class RecentTableViewCell: UITableViewCell {
    let backendless = Backendless.sharedInstance()
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!

    override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
    }
    func bindData(recent: NSDictionary){

    avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width/2
    avatarImageView.layer.masksToBounds = true

    self.avatarImageView.image = UIImage(named: "avatarPlaceHolder")

    let withUserId = (recent.objectForKey("withUserId") as? String)!

    //collect the backendless user and download avatar
    let whereClause = "objectId = '\(withUserId)'"

    let dataQuery = BackendlessDataQuery()
    dataQuery.whereClause = whereClause

    let dataStore = backendless.persistenceService.of(BackendlessUser.ofClass())
    dataStore.find(dataQuery, response: {(users: BackendlessCollection!) -> Void in

    let withUser = users.data.first as! BackendlessUser
    //use withUser to get our avatar

    }) {(fault: Fault!) -> Void in
    print("error , couldn't get user avatar: \(fault)")

    }
    nameLabel.text = recent["withUserUsername"] as? String
        lastMessageLabel.text = recent ["lastMessage"] as? String
        counterLabel.text = ""
        
        
        if (recent["counter"] as? Int)! != 0 {
            counterLabel.text = "\(recent["counter"]!) New"
            
            
            }
        let date  = dateFormatter().dateFromString((recent["date"] as? String)!)
        let seconds = NSDate().timeIntervalSinceDate(date!)
        dateLabel.text = TimeElapsed(seconds)
        }
        
        func TimeElapsed (seconds: NSTimeInterval) -> String{
            let elapsed: String?

            if seconds < 60 {
                elapsed = "just now"
            }else if (seconds < 60 * 60){
                let minutes = Int (seconds / 60)
                var minText = "min"
                if minutes > 1 {
                    minText = "mins"
                }
                elapsed = "\(minutes)\(minText)"
            } else if (seconds < 24 * 60 * 60){
                let hours =  Int (seconds / (60 * 60))
                var hourtext = "hour"
                if hours >  1 {
                    hourtext = "hours"
                }
                elapsed = "\(hours) \(hourtext)"
                
            }else {
                let days = Int (seconds / (24 * 60 * 60 ))
                var dayText = "day"
                if days > 1 {
                    dayText = "days"
                }
                elapsed = "\(days) \(dayText)"
                
            }
            return elapsed!
        }
        
    }
        
    