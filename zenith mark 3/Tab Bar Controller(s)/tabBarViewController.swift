//
//  tabBarViewController.swift
//  zenithmark3
//
//  Created by Arkaprabho Bose on 7/8/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//

import UIKit

class tabBarViewController: UITabBarController {
    
    @IBOutlet var tab: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedIndex = 1
        

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
