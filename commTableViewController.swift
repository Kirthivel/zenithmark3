//
//  commTableViewController.swift
//  zenithmark3
//
//  Created by Arkaprabho Bose on 7/30/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//

import UIKit

class commTableViewController: UITableViewController {


    
    @IBOutlet var table: UITableView!
    
    
    var clu = [clubName]()
    var out = [outName]()
       

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
       // table.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        //table.register(UITableViewCell.self, forCellReuseIdentifier: "dmMessagebox")
        clu.append(clubName(club: "Abhi Venkat"))
         clu.append(clubName(club: "FBLA"))
         clu.append(clubName(club: "Science NHS"))
         clu.append(clubName(club: "Science Olympiad"))
        out.append(outName(club: "Arka Bose"))
        out.append(outName(club: "FBLA"))
          out.append(outName(club: "FBLA"))
          out.append(outName(club: "FBLA"))
          out.append(outName(club: "FBLA"))
               
        

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section==0) {
            return out.count
        }
        else {
            return clu.count
        }
        
    }
    
   override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
         
              view.tintColor = UIColor.init(displayP3Red: 0.945, green: 0.911, blue: 0.839214, alpha: 1)
              let header = view as! UITableViewHeaderFooterView
              header.textLabel?.textAlignment = NSTextAlignment.center
              header.textLabel?.font = UIFont.init(name: "Kollektif-Bold", size: 30.0)
              header.textLabel?.textColor = UIColor.black
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section==0) {
            return "Officer Manager"
        }
        else {
            return "Inbox"
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "officerBox", for: indexPath) as! officerTableViewCell
            
            cell.textLabel?.text = out[indexPath.row].club
            cell.textLabel?.font = UIFont.init(name: "Kollektif", size: 30.0)
            
        return cell
        }
        
        
        
        else {
            
             let cell = tableView.dequeueReusableCell(withIdentifier: "dmMessagebox", for: indexPath) as! dmBoxTableViewCell
          
            cell.textLabel?.text = clu[indexPath.row].club
            cell.textLabel?.font = UIFont.init(name: "Kollektif", size: 30.0)
           // cell.configureWith(with: clu[indexPath.row])
            
        
            return cell
        }
        // Configure the cell...

       
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        table.deselectRow(at: indexPath, animated: true)
        
        
        if(indexPath.section == 1) {
        let vc = chatViewController()
        vc.title = clu[indexPath.row].club
        navigationController?.pushViewController(vc, animated: true)
        }
        else {
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "test"))! as! subGroupViewController as subGroupViewController
            vc.title = out[indexPath.row].club
            
            navigationController?.pushViewController(vc, animated:  true)
        }
        
        //show chat
        
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

struct clubName {
    let club:String
}


struct outName {
    let club:String
}
