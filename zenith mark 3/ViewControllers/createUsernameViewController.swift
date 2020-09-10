//
//  createUsernameViewController.swift
//  zenithmark3
//
//  Created by Sriabhi Venkat on 7/28/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//

import UIKit

class createUsernameViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if(usernameTextField != nil) {
            let mainTab = self.storyboard?.instantiateViewController(identifier: "mainTabVC") as? tabBarViewController
                       
                       self.navigationController?.pushViewController(mainTab!, animated: true)
        }
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

