//
//  ImagesListViewController.swift
//  Task 4
//
//  Created by Amais Sheikh on 28/10/2020.
//  Copyright © 2020 AmaisSheikh. All rights reserved.
//

import UIKit
import SideMenu

class ImagesListViewController: UIViewController
{
    @IBOutlet weak var imagesListTableView: UITableView!
    @IBOutlet weak var crossBtn: UIButton!
    
    var people = ["Max", "Julie", "Cian", "Amenda", "Smith",]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: true)
        imagesListTableView.delegate = self
        imagesListTableView.dataSource = self
        
        crossBtn.layer.cornerRadius = 5
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func crossBtnTapped(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ImagesListViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = imagesListTableView.dequeueReusableCell(withIdentifier: GALLERY_CELL_IDENTIFIER, for: indexPath) as! GalleryImageTableViewCell
        cell.randomImageView.image = UIImage(named: people[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return imagesListTableView.frame.size.width
    }
    
    
}
