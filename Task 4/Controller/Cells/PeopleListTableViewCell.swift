//
//  PeopleListTableViewCell.swift
//  Task 4
//
//  Created by Amais Sheikh on 28/10/2020.
//  Copyright © 2020 AmaisSheikh. All rights reserved.
//

import UIKit

class PeopleListTableViewCell: UITableViewCell
{
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2
        self.profileImageView.clipsToBounds = true
    }

}
