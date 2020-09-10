//
//  addingViewController.swift
//  zenithmark3
//
//  Created by Arkaprabho Bose on 8/20/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//

import UIKit

class addingViewController: UIViewController {
  
    @IBAction func newDmPressed(_ sender: Any) {
        
            let nextVC = chatViewController()
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    
    
    
   
    @IBAction func newClubButtonPressed(_ sender: Any) {
        
        
        
        let nextVC = self.storyboard?.instantiateViewController(identifier: "addNewClub") as? newClubInfoViewController

        
        
        print("out")
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
