//
//  upcomingTableViewController.swift
//  zenithmark3
//
//  Created by Arkaprabho Bose on 7/12/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//

import UIKit

class upcomingTableViewController: UITableViewController {

    
    
    @IBOutlet var table: UITableView!
    var clubs = [newClub]()
    
    
    @IBAction func refresh(_ sender: Any) {
        
        clubs.append(newClub(clubName: "FBLA"))
        
        table.reloadData()
        
        refreshControl?.endRefreshing()
    
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         table.register(newClubTableViewCell.nib(), forCellReuseIdentifier: newClubTableViewCell.identifier)
        
        table.delegate = self
        table.dataSource = self
        
        
      
         clubs.append(newClub(clubName: "National Honor Society"))
         clubs.append(newClub(clubName: "   Science National Honor Society"))
         clubs.append(newClub(clubName: "FBLA"))
        clubs.append(newClub(clubName: "FBLA"))
        clubs.append(newClub(clubName: "FBLA"))
        clubs.append(newClub(clubName: "FBLA"))
        clubs.append(newClub(clubName: "FBLA"))
    }

   

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubs.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.init(displayP3Red: 0.945, green: 0.911, blue: 0.839214, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textAlignment = NSTextAlignment.center
        header.textLabel?.font = UIFont.init(name: "Kollektif-Bold", size: 30.0)
        header.textLabel?.textColor = UIColor.black
        
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Upcoming Events"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: newClubTableViewCell.identifier, for: indexPath) as! newClubTableViewCell
    
        cell.configureWith(with: clubs[indexPath.row])
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
    
    
    
    
    struct newClub {
        
        let clubName:String
    }


