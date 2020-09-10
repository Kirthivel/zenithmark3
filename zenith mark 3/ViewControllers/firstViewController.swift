//
//  firstViewController.swift
//  zenithmark3
//
//  Created by Arkaprabho Bose on 7/20/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//

import UIKit

class firstViewController: UIViewController {
    @IBOutlet weak var gifView3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifView3.loadGif(name: "login")
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
