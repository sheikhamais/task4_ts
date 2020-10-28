//
//  GalleryImageTableViewCell.swift
//  Task 4
//
//  Created by Amais Sheikh on 28/10/2020.
//  Copyright © 2020 AmaisSheikh. All rights reserved.
//

import UIKit

class GalleryImageTableViewCell: UITableViewCell
{
    @IBOutlet weak var randomImageView: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
     
        randomImageView.layer.cornerRadius = 5
        randomImageView.clipsToBounds = true
    }
}
