//
//  ViewController.swift
//  zenith mark 3
//
//  Created by Arkaprabho Bose on 6/9/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var settingsTable: UITableView!
   
    let names = ["Privacy and Security","Account Information","etc","Log Out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        settingsTable.delegate = self
        settingsTable.dataSource = self
         
        
    
        
    }

}
    extension ViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if(indexPath.row == 3) {
                
             print("log out")
            }
            else{
                print("you tapped me")
            }
        }
        
        
    }
    
    
    extension ViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return names.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cellOne =  tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath)
            
            cellOne.textLabel?.text = names[indexPath.row]
            
            return cellOne
        }
        
        func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//            if(indexPath.row == 3) {
               
                 let loginScreen = self.storyboard?.instantiateViewController(identifier: "loginScreen") as? loginViewController
                 self.present(loginScreen!, animated: true, completion: nil)
                
//            }
        }
     

        }
        
        

    



