//
//  SideMenuRootViewController.swift
//  Task 4
//
//  Created by Amais Sheikh on 28/10/2020.
//  Copyright © 2020 AmaisSheikh. All rights reserved.
//

import UIKit

class SideMenuRootViewController: UIViewController
{
    @IBOutlet weak var peopleListTableView: UITableView!
    
    var people = ["Max", "Julie", "Cian", "Amenda", "Smith",]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        peopleListTableView.delegate = self
        peopleListTableView.dataSource = self
    }
    
    @IBAction func galleryTapped(_ sender: UIButton)
    {
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "imageListVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SideMenuRootViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = peopleListTableView.dequeueReusableCell(withIdentifier: USER_CELL_IDENTIFIER, for: indexPath) as! PeopleListTableViewCell
        cell.profileImageView.image = UIImage(named: people[indexPath.row])
        cell.nameLabel.text = people[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        peopleListTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
