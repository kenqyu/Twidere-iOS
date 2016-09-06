//
//  UserCell.swift
//  Twidere
//
//  Created by Mariotaku Lee on 16/8/21.
//  Copyright © 2016年 Mariotaku Dev. All rights reserved.
//

import UIKit
import SwiftyJSON

class UserCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var descriptionView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.makeCircular()
        // Initialization code
    }
    
    func displayUser(user: JSON) {
        let name = user["name"].stringValue
        let screenName = user["screen_name"].stringValue
        let nameString = NSMutableAttributedString()
        nameString.appendAttributedString(NSAttributedString(string: name, attributes: [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(nameView.font.pointSize)
            ]))
        nameString.appendAttributedString(NSAttributedString(string: "\n"))
        nameString.appendAttributedString(NSAttributedString(string: "@" + screenName, attributes: [
            NSFontAttributeName: UIFont.systemFontOfSize(nameView.font.pointSize * 0.9)
            ]))
        nameView.attributedText = nameString
        let profileImageUrl = user["profile_image_url_https"].string ?? user["profile_image_url"].stringValue
        
        descriptionView.text = user["description"].string
        
        profileImageView.displayImage(getProfileImageUrlForSize(profileImageUrl, size: .ReasonablySmall))
    }
    
}