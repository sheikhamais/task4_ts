//
//  TodoItemTableViewCell.swift
//  Task 4
//
//  Created by Amais Sheikh on 27/10/2020.
//  Copyright © 2020 AmaisSheikh. All rights reserved.
//

import UIKit

class TodoItemTableViewCell: UITableViewCell
{
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var deleteBtnView: UIView!
    @IBOutlet weak var deleteBtnWidthConstraint: NSLayoutConstraint!
    
    var delegate: TodoItemTableViewCellDelegate?
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        setupGestures()
    }
    
    @IBAction func deleteRowTapped(_ sender: UIButton)
    {
        delegate?.deleteTask(cell: self)
    }
    
    func setupGestures()
    {
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        leftSwipe.direction = .left

        self.contentView.addGestureRecognizer(rightSwipe)
        self.contentView.addGestureRecognizer(leftSwipe)
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer)
    {
        if sender.state == .ended
        {
            switch sender.direction
            {
            case .right:
                handleDeleteBtnVisibility(expand: true)
            case .left:
                handleDeleteBtnVisibility(expand: false)
            default:
                break
            }
        }
    }
    
    func handleDeleteBtnVisibility(expand: Bool)
    {
        UIView.animate(withDuration: 0.3)
        {
            if expand
            {
                self.deleteBtnWidthConstraint.constant = 88
            }
            else
            {
                self.deleteBtnWidthConstraint.constant = 0
            }
            self.contentView.layoutIfNeeded()
        }
    }
    
}
